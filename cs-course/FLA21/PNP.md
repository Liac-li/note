# PNP

##### Non-RE language

> RE $\subset$ all language

- the set of all TM is *countable*
- the set of all language is *uncountable*
- thus, function $L : \{TM\} \to \{language\}$ cannot be *onto* ($RE\subset$ All language)

1. Lemma: the set of all TMs is countable:
    Proof:
        a. with finite $\Sigma$, all string $w \in \Sigma^*$ can be ordered base on different length $n, \, n = 0,1,2,\dots$.
        b. all TM $M$ can be describe by a *finite-length string* $s, <M>$
        c. generate a list of strings and remove any strings that do not represent a TM to get a *set of TMs*
2. Lemma: the set of all languages if uncountable:
    Proof:
        a. fix an enumeration of all strings $s_1, s_2, \dots$
        b. a language $L$ is described by its *characteristic vector*, $\bm{x}_L$ whose $i$-th char is $1$ if $s_i$ in $L$, 
        c. consider $L = \{w | w\text{ is the i-th binary string and }w \text{ is not in the i-th language}\}$, then the $L$ is **uncountable**

##### Undecidable language

> decidable language $\subset$ RE (TM)

**The Halting Problem**

HALT = {<M, x> | TM M halts on input x}, is a language

##### co-RE (complement of a RE )

- **Theorem**: language $L$ is decidable if and only if $L$ is RE and $L$ is co-RE

$\Rightarrow$ HALT's complement is co-RE

## Complexity

> to classify decidable problem, but in real world we have limited resources (time, storage space)

#### Time complexity

Def: the running time ("time complexity") of a TM $M$ is a function:    

$$
    f: N \to N
$$
    
where $f(n)$ is the maximum number of steps $M$ uses on any input of length $n$

**Time complexity class**: TIME($t(n)$) = {$L$ | there exists TM $M$ that decides $L$ in time $O(t(n))$}

- **Theorem**: let $t(n)$ satisfy $t(n) \ge n$, every $t(n)$ multitape TM has a equiv single tape TM with $O(t(n)^2)$ 