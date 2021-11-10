# Syntax-Directed Translation

CFG construction $\to$ Meaning(Calculate result)

基于语法分析增加一些属性：
在产生式中引入
1. 属性：在文法符号上(Nonterminal)联系上若干信息
2. 语义规则：附加在产生式上(描述文法符号的属性值) 

#### 语法制导定义 Syntax-Directed Definition(SDD)

- CFG 和属性以及规则的借个
- 属性和文法符号关联 ( $A\to \alpha$ )
    - 综合属性: $A$ 的属性，依赖于 $A,\alpha$中的符号的属性(本身和子节点)
    - 继承属性: $X\in \alpha$ 的属性，依赖于 $A,\alpha$中的符号的属性(本身，父节点和兄弟)

- 语义规则和产生式相关联

> Problem:
> 1. 属性计算的次序
> 2. 相互依赖的问题

##### 无环依赖属性规则

- S 属性: 所有的属性属性都是综合属性
- L 属性：对于$A\to X_1X_2\dots X_n$ 其中的每个属性
    - 是综合属性
    - 继承属性
        - $X_{i\cdot} a$ 依赖于 $A$ 的集成属性
        - $X_{i\cdot} a$ 以来与左边的兄弟的集成属性
        - 