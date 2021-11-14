# Syntax-Directed Translation

CFG construction $\to$ Meaning(Calculate result)

基于语法分析增加一些属性：
在产生式中引入
1. 属性：在文法符号上(Nonterminal)联系上若干信息
2. 语义规则：附加在产生式上(描述文法符号的属性值) 

A syntax-directed definition specifies the values of attributes by associating semantic rules with the grammar productions

#### 语法制导定义 Syntax-Directed Definition(SDD)

CFG together with attributes and rules

- CFG 和属性以及规则的借个
- 属性和文法符号关联 ( $A\to \alpha$ )
    - 综合属性(Synthesized Attributes): $A$ 的属性，依赖于 $A,\alpha$中的符号的属性(本身和子节点)
        - nonterminal A
        - A only in terms of attributes values at the children of N and at N itself.
        - Production has A as its head
    - 继承属性(Inherited Attributes): $X\in \alpha$ 的属性，依赖于 $A,\alpha$中的符号的属性(本身，父节点和兄弟)
        - nonterminal B
        - Production has B as a symbol in its body 
        - in terms of attributes' values at N's parent, N itself, and N's siblings
        - useful when the structure of a parse tree does not match the abstract syntax of the source code
- 语义规则和产生式相关联

- S-attributed: SDD that involves only synthesized attributes
    - Can be implemented naturally in conjunction with an LR parser

> Problem:
> 1. 属性计算的次序(Evaluation Order)
> 2. 相互依赖的问题(cyclic)

##### 无环依赖属性规则

**Dependance Graph**: edge $a\to b$, production of b is in terms of a(just need travel all nodes following arrow direction)

- If there is any cycle in the graph, then there are no topological sorts; that is, there is no way to evaluate the SDD on this parse tree 


##### Subset of SDD's that guarantee an evaluation order

- S 属性: 所有的属性属性都是综合属性
    - can be evaluated in *any* bottom-up order, generally postorder traversal(LR parser reduce a production to its head)
- L 属性：对于$A\to X_1X_2\dots X_n$ 其中的每个属性(L for left-to-right)
    1. Synthesized, or
    2. Inherited with rules limited: $A\to X_1X_2\dots X_n$, with inherited attributed $X_i.a$
        - inherited attributed associated with the head $A$
        - Either inherited or synthesized attributes associated with the occurrences of symbols $X_1,X_2,\dots, X_{i-1}$ located to *the left of $X_i$* 
        - inherited or synthesized attributed associated with this occurrence of $X_i$ itself, but in a way that there are *no cycles in a dependence graph formed by the attributes of this $X_i$*
        
#### Sematic Rules with Controlled side effect

Attribute grammar have no side effect anc all *any* evaluation order

> Side Effect: translation schemes and sematic actions

**Rules**:
1. Permit incidental side effects that do not constrain attribute evaluation.
2. Constrain the allowable evaluation orders, so that the same translation is produced for any allowable order

> Do any thing which dose not affect the evaluation