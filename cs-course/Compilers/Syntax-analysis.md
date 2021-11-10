# Syntax Analysis(Parsing)

使用程序语言规范解析程序运行逻辑

Input: 词法分析器的词法tokens
Output： 语法树

**功能**：
1. 验证源程序的合法性，并输出良好构造的语法结构
2. 对于病构的程序，报告语法错误，并且搞点错误恢复

文法：描述语言构造的层次化结构

#### 上下文无关文法

**结构**

- 终结符号：语言的最基本构造，没有子结构 (`int i = 1`)
- 非终结符号：特定串的集合，给语言的层次结构(`(expr), stmt`)
- 开始符号: 特定的非终结符号，为一个串的开始，**其表示的串的集合是这个文法生成的语言**
- 一组产生式：终结和非终结的组合方式: 非终结符号 $\to$ [终结|非终结]*


##### 推导
推导方法(匹配): 从开始符号开始，多个重写步骤把一个非终结符号替换为他的某个产生式的体

- 句型: 从$S$开始，推到出的 $S \overset{*}{\Rightarrow} \alpha$ 则 $\alpha$ 为G的一个句型
- 句子：不包含非终结符号的句型的集合
- 语言 $\{w|S \overset{*}{\Rightarrow} w\}$ 句子的集合，由文法$G$ 生成的语言被称为上下文无关语言$L(G)$ 

推导替换的问题:
1. 每一步替换哪个非终结符号(最左替换，最右替换)
2. 用哪个生成式来替换非终结符号(?)

##### 文法的问题

- 消除二义性： 同一文法生成不同的树(对特定的一个句子)
  - matched: if...then...else
  - priority： id + id * id 
    $$
      \begin{align*}
        E &\to E + T | E - T | T \\
        T &\to T * F | T / F | F \\
        F &\to (E) | id
      \end{align*}
    $$
    通过不同的符号来引入文法推导的优先级
    > 一般的，语法树越低地方运算优先级越高
- 消除左递归： $A \overset{+}{\Rightarrow} A\alpha$
  - 立即左递归的消除
  $$
    A \overset{*}{\Rightarrow} A\alpha|\beta
    \qquad \underrightarrow{转化为} \qquad 
    \begin{align*}
      A &\overset{*}{\Rightarrow} \beta A'\\
      A' &\overset{*}{\Rightarrow} \alpha A'|\epsilon
    \end{align*}
  $$
  - 消除算法：
    对于所有的非终结符号进行排序( $A_1, A_2, \dots$ )， 我们假设$i < j$
    - $A_i \to A_j\alpha$
    - $A_j \to A_i\alpha$ , 有可能循环的替换后出现直接左递归
      直接替换掉，然后归约到直接左递归
- 提取左公因子:(简化就句型的选择)

#### 自顶向下分析

寻找输入串的最左推导的过程
> 从最上的开始符号找 A-production parsing

- Determine a production: recursive descent parsing
    有点像 DFS
    ```c++
    code without backtrace

    void A() {
        Choose an A-production, A = X_1, ... X_n
        for (i = 1 to n) { // 不能有左递归
            if (X_i is a nonterminal) {
                call produce X_i()
            } else if (X_i equals the current input symbol a) {
                advance the input to the next symbol
            } else {
                Error or back to another A-production(Backtrace)
            }
        }
    }
    ```
    but backtrace is inefficient

> Notice use the alg to generate a output string to match the input symbol

- 无回溯的技术：FIRST and FOLLOW(在输入中向前看固定多个符号)
    > expended DFS
    - FIRST( $\alpha$ ): 可以从 $\alpha$ 推导得到的串的首符号(*terminal*)的集合 $\alpha \Rightarrow a, a\in FIRST(\alpha)$
    - FOLLOW( $A$ ): 可能在某些句型中紧跟在A后的**终结符号**的集合

##### $LL(1)$ 文法 

> 保证总可以找到down parsing方向的文法

$A\to \alpha|\beta$

1. no terminal $a$ do both $\alpha$ and $\beta$ derive strings beginning with $a$
2. at most *one* $\alpha$ and $\beta$ and derive the *empty string*
3. if $\beta \Rightarrow^* \epsilon$, then $\alpha$ dose note derive any string beginning with a terminal in FOLLOW(A). The same with $\alpha \Rightarrow^* \epsilon$

- First($\alpha$) $\cap$ First($\beta$) = $\emptyset$
- $\alpha \to \epsilon, \beta\to \epsilon$ 不同时成立
- $if \, \beta \to \epsilon, then \,FIRST(\alpha) \cap FOLLOW(\beta) = \emptyset$
> 通过 FIRST， FOLLOW 可以确定的选择出 A-production 的语言

**Parsing Table**:

$A \to \alpha$

1. For each terminal $a$ in FIRST($\alpha$) in $M[A, a]$
2. if $\epsilon$ **in** FIRST($\alpha$), for each terminal $b$ in FOLLOW(A), add $A\to\alpha$ 

> Parsing Table include all state *reachable*

##### Non-recursive method

Maintain a Stack

```Bash
    Input: string w, parsing table M

    a <- the first symbol of w
    X <- the top stack symbol

    while (X != $) { # stack not empty
        if (X = a) pop the stack and let a be the next symbol of w
        else if (X is terminal) error() # end too early
        else if (M[X, a] is an error entry) error() # invalid in LL(1)
        else if (M[X, a] = X-> Y1, Y2,...Yk) {
            output the production X-> ...
            pop the stack;
            push Yk, ... Y1 onto the stack with Y1 on top # inverse ordered
        }
        
        X <- the top stack symbol
    } 
```

#### Bottom-Up parsing： 

想法：从产生式来逐步替换到单独的根(a-production $\to$ nonterminal) *Shift-reduce parsing*

Find the production which's matched the string $w$ 

> - when to reduce
> - which production to apply

**Handle**:

handle is a *substring* that matched the body of production, and whose reduction represents one step along the reverse of a rightmost derivation

> ??? why not leftmost

一个Handle是可以在有 $S \Rightarrow_{rm} \alpha \beta w$, 后apply $A\to \beta$ 可以获得**上一层**的**最右推导**式子的 production $A\to\beta$为一个句柄

也就是说，只要一直使用句柄进行归约，就可以得到最右推导的开始符号 $S$

- 归约前后都是最右句型
- 
- 无二义性文法的每个最右句型都只有一个句柄

##### Shift-reduce

Alg: shift-reduce with stack:
- Init: Stack empty($\$$), with input ($w\$$)
- Steps:
    - shift zero or more symbols into stack
    - reduce stack top as a handel

Observation: handle always appears on the stack top

**Conflicting**

- a shift/reduce conflict
- a reduce/reduce conflict

must $LR(k)$ grammars without conflict

##### $LR$ parsing

Introduce item ($LR(0)$ item), to keep track of where we are in parse, to avoid *reduce/shift conflict*

> $A\to X_1\cdot X_2$ means we have seen $X_1$, and hope to see a string derivable from $X_2$ 

**Closure**:

For $I$ is set of items for grammar $G$, CLOSURE($I$) constructed with:
1. initially, add **every** item in $I$ to CLOSURE($I$)
2. if $A\to \alpha\cdot B\beta$ in CLOSURE($I$), and $B\to \gamma$ is a production, then add $B\to \cdot\gamma$ to CLOSURE($I$). Apply this rule until no more new items can be added

> Target: just keep track on the terminals have be seen

**Goto**

GOTO($I, X$) where $I$ is a *set* of items and $X$ is a grammar symbol, GOTO($I, X$) is the closure of the set of all items $[A\to \alpha X\cdot\beta]$ such that $[A\to \alpha\cdot X\beta]$ is in $I$

> Closure for current parse state, Goto is the next parse state with action $X$


**Use of the LR(0) Automaton** (PDA)

- States: *sets* of items from the canonical LR(0) collection
- Transitions: GOTO function
- $S_0$: CLOSURE($\{[S'\to \cdot S]\}$), kernel closure

> PDA 相关算法可以看[FLA-PDA](../FLA21/Pushdown-Automata.md)