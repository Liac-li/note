# PDA (Push-down Automata)

Automata with stack

A PDA described by:
1. A *finite* states( $ Q $ )
2. An input alphabet( $ \Sigma $ )
3. A stack alphabet( $ \Gamma $ )
4. A transition function( $ \delta $ )
5. A start state( $ q_0 \in Q $ )
6. A start symbol( $ Z_0 \in \Gamma $ ), also marks the bottom of stack
7. A *set of* final states ( $ F \in Q $ )

$\delta(q, a, Z)$ is a **set** of *zero or more* actions of the from $(q, XZ_0)$ ($XZ_0$ for stack state), also mean the transition is undetermined

> $\delta(q, 0, Z_0) = \{(q, XZ_0)\}$ means we trans from state $q$ to $q$ and *replace* $Z_0$ at stack top with $XZ_0$
> also to pop symbol $X$ from stack, we do $\delta(q, 1, X) = \{(p, \epsilon)\}$

> It's possible enter final state but didn't consume input

#### Instantaneous Description(ID)

A ID is a triple $(q, w, a)$ 
- $q$, Automata state
- $w$ input string
- $a$ stack state

#### Gose-TO Relation:

ID $I$ cna become ID $J$ in one move of the PDA, we write $I \vdash J$. Formally, $(q, aw, X\alpha)\vdash (p, w,\beta\alpha)$ for any $w$ and $\alpha$, if $\delta(q, a, X)$ *contains* $(p, \beta)$

Also, we extend $\vdash \to \vdash^*$ meaning "zero or more moves" 

> Example: $(q, 01, Z_0) \vdash (q, 1, XZ_0)\vdash (p, \epsilon, Z_0)\vdash (f, \epsilon, Z_0$
>> Avoid enter final state while input string not empty(completely consumed)

- Theorem 1: Given a PDA P, if $(q, w, \alpha) \vdash^* (p, y, \beta)$, $\forall w \in \Sigma^*, \gamma \in \Gamma^*$, we have $(q, xw, \alpha\gamma) \vdash^* (p, yw, \beta\gamma)$

    Vice Versa? no
- Theorem 2: Given PDA $P$, if $(q, xw, \alpha) \vdash^* (p, yw, \beta)$, we have $(q, x, \alpha) \vdash^* (p, y,\beta)$

> 栈的长短是不固定的，且改变也是非单调的

#### Language of PDA

- Language use *final state*:

    $L(P)$ is the set of strings $w$ such that $(q_0, w, Z_0) \vdash^* (f, \epsilon, \alpha)$ for final state $f$ and **any stack state** $\alpha$
- Language defined by *empty stack*:
    $N(P)$  is the set of strings $w$ such that $(q_0, w, Z_0) \vdash^* (q, \epsilon, \epsilon)$ for **any state** $q$

> $L(P)$ and $N(P)$ may not same given $P$

> For any CFL, we always can construct $L(P_1)$ or $N(P_2)$ represent the CFL, but maybe different $P_1, P_2$

##### Equivalence of Language $L(P), N(P)$ 

- Given $L(P)$ we can construct $N(P')$ to express $L(P)$
- Given $N(P)$ we can construct $L(P')$ to express $N(P)$

> For ${0^n1^n}$, $L(P)$ express ${0^n1^n}$, and $N(P)$ for nothing

**Proof**:
- $L(P) \to N(P')$:
    - $P'$ will simulate $P$
    - if $P$ accepts, $P'$ will empty its stack
    - $P'$ has to avoid accidentally accept with empty state, thus use a special bottom-marker to catch the case where $P$ empties its stack

> how to empties stack after final state

> To construct same $A\to B$, $B$ must do what $A$ can, and must can't do what $A$ can't

- $N(P) \to N(P'')$
    - $P''$ simulate $P$
    - $P''$ has a special bottom-marker to catch the situation where $P$ empties its stack, but transition function $\delta$ need symbols in stack    
    - if so, $P''$ accepts

> how from state with $\epsilon$ input and empty stack to final state 

##### Deterministic PDA's

- nPDA is powerful than DPDA (回串)
- if $L$ is a regular language, there exists a DPDA $P$ such that $L = L(P)$

> RE -> DPDA(L(P)) -> NPDA
> RE (not)-> DPEA(N(P)) -> DPDA(L(P))

- Given a DPDA $P$ defined by final states, $L=L(P)$, L has a *non-ambiguous* grammar
    However, non-ambiguous grammars  donn't have to be presented by DPDA($ww^r, S\to 0S0|1S1|\epsilon$)

#### Equivalence of PDA, CFG

Use CFL as bridge between CFG and PDA

##### CFG -> PDA

Let $L = L(G)$, construct PDA $P$, such that $N(P) = L$

> ??? why use $N(P)$

$P$ has:
- One state q
- Input symbols = terminals of $G$
- Stack symbols = all symbols of $G$
- Start symbols = start symbol of $G$
- Final state: at empty stack, the input consumed is a string in $L(G)$

at each step, $P$ represents some *left-sentential form* (snapshot)

If $\alpha$ in $P$ stack, and $P$ has so far consumed $x$, then $P$ represent left-sentential form $x\alpha$($x$ <- terminals, $\alpha$ <- nonterminals)

**Transition**:

- Type1: $\delta(q, a, a) = (q, \epsilon)$ : replace $a$ with $\epsilon$ from stack (matched input)
- Type2: If $A \to \alpha$ is production of G then $\delta(q, \epsilon, A)$ **contains** $(q, \alpha)$: guess a production of $A$ and represent the next LSF in the derivation
    > notice $P$ is a nPDA

> Use $N(P)$ to simulate left-most derivation in CFG
    
**Proof $N(P) = L(G)$**

to show that $(q, wx, S) \vdash^* (q, x, \alpha)$ for any $x$ if and only if $S\Rightarrow^*_{lm} w\alpha$

- only if:
    - Basis: 0 steps $\alpha = S, w=\epsilon$, $S\Rightarrow^*_{lm}S$ is surely true
    - Induction: $n \to n+1$
        there are only $two$ case, Type1 and Type2 rules
        - Type1: $(q, yax, S) \vdash^* (q, ax, a\alpha) \vdash (q, x, \alpha)$
            By the IH applied to the first $n-1$ steps, $S\Rightarrow^*_{lm} ya\alpha$, but $ya = w$, so $S\Rightarrow^*_{lm} w\alpha$
        - Type2: $(q, wx, S)\vdash^*(q, x, A\beta)\vdash (q, x, \gamma\beta)$, and $\alpha=\gamma\beta$
    - let $x = \alpha = \epsilon$, $(q, wx, S)\vdash^* (q, \epsilon, \epsilon)$, we have $S\Rightarrow_{lm}^* w$

##### PDA -> CFG

we assume $L = N(P)$

> Induction bases on height of stack

> The construction method is to extract information from transition function of PDA to A-productions. 

Set $[qXp]$ as new nonternimal of CFG and $X$ represent symbol in stack

TODO: alg

#### Properties of CFL

- Pumping Lemma:

TODO: note