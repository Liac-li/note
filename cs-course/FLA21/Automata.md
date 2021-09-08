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

- **Automata of all kinds define languages**
- For DFA and DFA language $L(A)$, $L(A)$ is the set of strings labeling **paths from the start state to the final state** ( $L(A)$ is a set of strings $w$ s.t. $\delta(q_0, w)$ is in $F$ )

## Regular language

A language is regular is accepted by some DFA

> **DFA 不会记数**
