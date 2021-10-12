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
- 语言 $\{w|S \overset{*}{\Rightarrow} w\}$ TODO

##### 文法的问题

- 消除二义性： 同一文法生成不同的树
  - matched: if...then...else
  - priority： id + id * id TODO: example
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
  - 消除算法： TODO 
