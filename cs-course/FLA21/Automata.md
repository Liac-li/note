# Automata

## Finite Automata 

Finite or infinite states machine

##### Description

- Acceptance: Given a sequence of inputs(languages), start in the start state and follow the transition from each symbol in turn

##### Language of an automaton

- Language should be set of strings accepted by automaton
- Donated of $L(A)$
- Different final state $\to$ different language

## Deterministic finite automata

- Alphabet: **finite** set fo symbols
- String over alphabet $\Sigma$ is a list, each element of which if a member of $\Sigma$ (could be **infinite**)
- Language must be a subset of $\Sigma^*$ (remember the $\bm{\epsilon}$, the empty string)

##### Formalism for definite languages

1. Finite set of state($Q$)
2. Input alphabet  ($\Sigma$)
3. Transition function($\delta$)
4. Start state ($q_0 \in Q$)
5. A set of final states($F \subseteq Q$)
    > Finite and accept are synonyms

- Transition function: Take state and an input symbol as arguments, $\delta(q, a)$

    Note: $\delta$ is a total function. Always a next state (add **Dead** state if no transition)

- **Extended** Transition Function: extending $\delta$ to a state and a string(such as $\delta(q, a_0a_1\dots)$ )

    Rules:
    - Basic: $\delta(q, \epsilon) = q$
    - Induction: $\delta(q, wa) = \delta(\delta(q, w), a)$

##### Language of DFA

- **Automata of all kinds define languages** (set)
- For DFA and DFA language $L(A)$, $L(A)$ is the set of strings labeling **paths from the start state to the final state** ( $L(A)$ is a set of strings $w$ s.t. $\delta(q_0, w)$ is in $F$ )

## Regular language

A language is regular is accepted by some DFA, the DFA must accept **only** the strings in L(不是超集，不是子集)

> **DFA 不会记数**, 可以有穷，但是不能表示无穷

- Example:

    $L_3 = \{w | w \in \{0, 1\}^*\}$, and $w$ viewed as a binary integer is divisible by 23

    end with $10111b$?

    取模23只有23种

**Theory**: Reverse of a regular language is also regular

## Nondeterministic Finite automata (NFA)

1. Nondeterministic
2. Subset construction
3. $\epsilon$ - Transitions

#### Nondeterministic

- Accept if any sequence of **choices** leads to a final state

**Set**

**Formal NFA** 

- Transition Functions: all become a set. Basic : $\delta(q, \epsilon) = \{q\}$
- Language of NFA: 
    if $\delta(q_0, w)$ contains at least one final set, then $w$ is accepted by NFA ( $F \cap \delta(q_0, w) \neq \emptyset$ )

    Language is set of strings it accepts

#### Equivalence of DFA's and NFA's

- DFA can be turned into an NFA that accepts same languages (表达能力的等价)
    - turn $\delta_D(q, a) = p\to \delta_N(q, a) = \{p\}$
- For any NFA there is a DFA that accepts the same language
    - Proof: subset construction
    - number of states of DFA cna be exponential in the number of stated of NFA

##### Subset Construction

Given NFA with $Q, \Sigma, \delta_N, q_0, F$, to construct DFA's elements

1. $\Sigma$ must be same
2. states $2^{Q}$ (set of subsets of Q)
3. Start state $\{q_0\}$ (all state of DFA become set)
4. Final state: all those with member of $F$ (Define of NFA $F$)

    
> Critical Point:
> DFA states have names are set of NFA states, but must be understand as a single symbol, while processing as a set with extended $\delta(q, a)$

5. $\delta_D(\{q_1, \dots, q_k\}, a) = \cap_{i\in (1, k)} \delta_N(q_i, a)$


> why num will be exponential: DFA 的状态是直接利用NFA的状态集合展开的，这个具体的状态数是不确定的
> 感觉上像是一个BFS,利用NFA的状态转移的子集直接构造成DFA的转移集合

**Proof**

base on string
> a little tricky

**Extended NFA ($\epsilon$-NFA)**

- $\epsilon-closure(s)$, represent as $CL(s)$
- Extended $\delta$


Every NFA is an $\epsilon$-NFA

##### Summary

- DFA, NFA, $\epsilon$-NFA all accept exactly the same set of languages, regular languages
- Only DFA can be implemented

