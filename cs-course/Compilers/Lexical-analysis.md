# Syntax analysis

读入源程序的字符， 生成词素(lexeme), 输出词法单元 

##### 名词解释

1. Token: (token name, [attribute value])

    token name 不一定与单词一致，主要是一个抽象代表
    
    attribute value: 通常是一个结构化数据 (多个属性)
    > 比如定义域的识别是怎么完成的，只识别 token-name, 还是 (token-name, attr-val)
2. Lexeme: 与 Pattern 匹配而识别到的词法单元实例
3. Pattern: 可以理解为正则表达式

##### 实现方式

1. 基于代码范式，手工编写规则
2. 利用现成的词法分析器生成工具(lex flex), 给出模式

正则表达式：这个正则表达式是个什么构造，是怎么实现的

## 词法单元的归约

##### 相关概念

详见 [FLA21-intro](../FLA21/Intro.md)

- 字母表
- 字符串(string)：prefix, suffix, sub-sequence(随意删除子串), sub-string(在原串中是了连续的)

#### 正则表达式

可以高效、简洁的表示处理词法单元的模式类型

正则表达式 r 定义的一个语言 L(r)， 也即一个正则集合

##### Definition

- Basic: a 为 $\Sigma$ 上的一个符号，a 为正则，$L(a) = \{a\}$
- Induction step

    Basic:
    
    1. Select: $(r) | (s), L((r)|(s)) = L(r)\cup L(s)$
    2. Concatenate: $(r)(s), L((r)(s)) = L(r)L(s)$
    3. Closure: $(r)^*, L((r)^*) = (L(r))^*$
    4. Bracket: $L((r)) = L(r)$

    Extended:
    
    1. $r+ = rr^*$, more than one
    2. $r? = \epsilon| r$, zero or one 
    3. $[abc]$, $[a-zA-Z]$

- 优先级: $* > \text{链接符} > |$

##### 性质
- 等价性：若 $r$ 和 $s$ 表示同样的语言
    - $(a|b)^*， a^*b^*$ 不等价 - 任意a,b的序列， a任意多 + b任意多
    - $(a|b)^*, (a^*b^*)^*$ 等价 - 任意a,b的序列
- 运算 
    |Operator| 性质|性质 |性质 |
    |--|--|--|--|
    | $\vert$ | $r\vert s = s\vert r$ | $r\vert(s\vert t) = (r\vert s)\vert t$ | $r(s\vert t) = rs \vert rt$ |
    |concatenate| $\epsilon r = r\epsilon$ |
    | $*$ | $r^* = (r\vert \epsilon)^* = (r\vert \epsilon)(r\vert \epsilon)\cdots$ | $r^{**} = r^*$ |



**正则定义**: 对于正则表达式的一个命名，$d_i \to r_i$
- $d_i \not \in \Sigma$
- $\forall r_i$ 为 $\Sigma \cup \{d_1, d_2,\dots, d_{i-1}\}$ 上的正则表达式，也即新的正正则表达式可以利用已定义的正则定义 

## 词法单元的识别

状态转移图

检查出入字符串，在前缀中找出和**某个模式**匹配的词素

利用状态转换图来表示一个词法的分析 (也就是利用一个 DFA 来决定)

> 详情参见 [FLA-AutomataDFA](../FLA21/Automata.md)

#### 状态转移图

**state**: 看作在识别词素的过程中可能出现的情况，是已经处理过的部分的总结, 需要start和end
**edge**: 从一个状态到灵位一的转台，是一个符号或者多个符号 $\delta(s, a)$

保留字(关键字问题)：混淆在patten里面
- 在 $\Sigma$ 中预填保留字，作为整体
-  单独建立保留字的状态图 

> 一种代码实现的设想： 模仿jyy的fish判断问题

#### 有穷自动机
|类型|action|edge|
| -- | --- | -- |
|NFA| 一个符号离开同一个符号的多条边|可以有边的标号为 $\epsilon$ |
|DFA|对于所有状态和字符，有且只有一条离开该状态的转移为该符号的边(确定的下一状态转移) | 没有标记为 $\epsilon$ 的边 (确定的状态识别)|

每一个NFA都有一个等价的DFA

##### NFA 转换 DFA- 子集构造法

利用DFA处理所有NFA的子集

- 并行的模拟：NFA在给定一个输入 $w$ 的所有的动作
- DFA 读入 $w$ 到达的状态和 NFA 读入 $w$ 的**可能的状态的集合**


**操作**

- $\epsilon-closure(s)$: 从NFA的s开始只通过 $\epsilon$ 的到达的状态的集合
- $\epsilon-closure(T) \dot= \cup_{s\in T}\epsilon-closure(s)$
- $move(T, a) \dot= \cup_{s\in T} move(s, a)$：从 $T$ 中的某个状态 $s$ 通过转换 $a$ 可以**到达**的NFA状态的集合(到达包含 $\epsilon$ )

```bash
Dataset := e-closure(s0)
c = nextChar()
while (c != EOF) {
  S = e-closure(move(S, c))
  c = nextChar()
}
if (S and F != empty) return yes
else return no
```
1. NFA状态子集 $\to$ DFA一个状态
2. 利用 $\epsilon-closure()$ 消除 $\epsilon$ 边

**正则表达式的处理**

1. 正则表达式转换为NFA
2. NFA转DFA

##### DFA 状态最小化

可区分：
- 从 $x,t$开始沿着 $w$ 只有一个可以到达接受状态，则$w$ 区分 $x, t$
- 若没有 $w$ 区分 $s, t$, 则 $s, t$ 不可区分 

> NFA的状态合并是指下一状态
> DFA的状态合并是指最后的接受状态
>> 参考等价的automata指**接受**相同的正则语言

思路：把DFA的状态划分为组内互相不可区分的小组，把组内状态合并。


##### 正则转NFA

根据正则的递归定义，按照正则的结构**递归**构造出响应的NFA

1. 构造部分NFA
2. 根据正则的规则进行组合

|递归规则|处理|
|-|-|
|或|增加头尾新状态，用$\epsilon$作为或的链接 |
|||
|$*$| $N(s)$ 的末尾到头， 用$\epsilon$链接|