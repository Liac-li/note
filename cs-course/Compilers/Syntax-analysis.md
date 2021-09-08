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
    
    1. $r^+ = rr^*$, more than one
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