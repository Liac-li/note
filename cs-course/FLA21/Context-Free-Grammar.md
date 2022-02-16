# Context-free grammars

context-free grammar is powerful than RE, but not strong enough

Basic idea: use "variables" to stand for string, defined recursively
- Terminals: symbols of the alphabet of the language being defined ( $\epsilon$ may not in alphabet)
- Variable(nonterminals): a **finite set** of other symbols, each of which represents a language
- Production: variable $\to$ string of variables and terminals

> Context-free: we do derive on the variables but don't care the context of the variable

- $\Rightarrow^*$ zero or more derivation steps
    - basic: $\alpha \Rightarrow^* \alpha$
    - induction: $\alpha \Rightarrow^* \beta, \beta\Rightarrow^*\gamma$, then $\alpha\Rightarrow^*\gamma$
- sentential form: any string of variables and/or terminals derived from the start symbol( $\alpha$  is sentential form $iff S\Rightarrow^* \alpha$ )
- language: all terminals derived from $S$ ( $\{w | S\Rightarrow^* w\}$ ), also called *contest-free language* (CFL)
> CFL's can count two things, not three (Finite Auto-machine with stack, only two thing)
- Leftmost and Rightmost derivation

#### Backus-Naur Form (BNF)

- variables: word in <...> 
- terminals: **End**, <u>End</u>
- derivation: \<stmt> ::= strings
- ...: for one or more
- [...] : optional 

#### Parse Tree

Tree labeled with the symbols in CFG

- leafs: terminal or $\epsilon$
- interior nodes: variables
    - children are labeled with the body of production of the parent
- root: start symbol
- concatenation of the leaves in left-to-right order, called the yield of the parse tree

> in CFG, every variable can be a root, (parse with root A)

Trees, leftmost and rightmost derivations correspond

**Proof**: induction base on *height*

**Ambiguous is property of Grammar not Language**

> ??? How to proof a grammar is unambiguous
>> LL(1) Grammar is **unambiguous**
>> can always figure out a production to use in the left most derivation
> 
> most programming language have LL(1) grammars

But certain **CFL's** are *inherently ambiguous*, every grammar for the language is ambiguous ( $\{0^i1^j2^k|i=j \,or\, j=k\}$)

#### Normal Forms for CFG's 

##### Elimination useless variables

Variable that derives nothing:
- Consider: $S\to AB,\, A\to aA|a,\,B\to AB$

- Then the production of $B$ always end with a nonterminal, then $B$ is **useless** (derives nothing), which occurs $S$ derives nothing

**Discovery Algorithm**: inductively find the reachable terminals($A\to a$), to check whether $S$ derives a language

we can proof, Discovery alg will discover **all** production derive terminal

1. Eliminating the useless production
2. Elimination the unreachable production
(Ordered)

##### Removing Epsilon

Key idea: let $A\to X_1X_2\dots$ be a family of productions

remove the nullable symbol from productions recursively

Proof: 
All variables in $A$:
- if $w\neq \epsilon$ and $A \Rightarrow_{old}^* w$, then $A\Rightarrow_{new}^* w$
- if $A\Rightarrow_{new}^* w$ and $w \neq \epsilon$, then $A\Rightarrow_{old}^* w$

Then let $A$ be the **start symbol**, prove that $L(new) = L(old) - \{\epsilon\}$

Proof base on *derivation step*

##### Removing Unit Productions ($A\to B, B\to C$)

Basic Idea: Find all paris $(A,B)$ such that $A\Rightarrow^* B$ by a sequence of unit productions *only*

##### Chomsky normal Form


**Steps**:

- Eliminating all $\epsilon$ production
    Do subset of the production may introduce unit production or useless variables
- Elimination all unit production
- Elimination all nonterminal production(useless variables)
- Elimination all unreachable productions

> Eliminating unit production will not introduce $\epsilon$-production(construction new production family)
> Elimination useless production will not introduce any new production(only delete)

**Property**:
- no useless symbols
- no $\epsilon$-productions
- no unit productions

ie. all production must be single terminal or length $\ge$ 2

**Chomsky Normal Form**:
A CFG whose production only be two form:
- $A\to BC$ (length can be 2 only)
    we can use new $A'$ corresponding to $BC$ in $S\to ABC$ reduce the production bodies' length of which greater equal 2
- $A\to a$

**Grammar in Chomsky normal form will generate a *binary* parsing tree**
