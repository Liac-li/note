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

