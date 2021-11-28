# Turing Machine

The purpose of TM is to prove thar certain specific language have no algorithm (Computable, Undecidable)

**Turing Machine**:
- A *finite set* of states($Q$)
- An input alphabet ($\Sigma$)
- A tape alphabet ($\Gamma$, $\Sigma \subset \Gamma$)
- Transition function ($\delta$)
    - $\delta(q, Z)$ $q$ - state, $Z$ - tape symbol in $\Gamma$
    1. *Undefined* 
    2. a triple of the form $(p, Y, D)$
        - p is state
        - Y is new tape symbol (may write a tape symbol in the tape cell scanned, replacing whatever symbol was there)
        - D is Direction, L or R

- Start state ($q_0 \in Q$)
- *Blank symbol* ($B \in \Gamma - \Sigma$)
    All tape except for the the input is blank *initially*
- Set of final states ($F \in Q$)

##### ID's (Instantaneous Description) of TM

TM can only visit finite states after finite moving, though TM has infinitely long tape

- Represent the finite control 
- Represent the tape-head position

**ID**:

$$
    X_1X_2\dots X_{i-1}qX_i X_{i+1} \dots X_n
$$

1. $q$ is the state of the Turing Machine
2. The tape-head is scanning $i$th symbol from the *left* 
3. $X_1X_2\dots X_n$ is the portion of the tape between the leftmost and the rightmost *nonblank* (finite visited tape symbols)

> use Tape + state to represent the TM status