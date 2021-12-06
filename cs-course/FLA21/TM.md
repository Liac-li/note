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

**Language of TM**:

- $L(M)$ is defined by the final states:
$$
    L(M) = \{q_0 w | q_0w \vdash^* I\}, \text{where} I \text{is ID's with final state}
$$

- In other words, TM can accept language by *halting*. We define language by halting:
$$
    H(M) = \{q_0w |q_0w \vdash^* I\} \text{where there is no more move form } I 
$$

> We assume that a TM always halts when it is an accepting state
> ***recursive Language***: always halt eventually (accepting by final state) (Algorithm)
>> Almost anything you can think of is recursive
>
> ***recursive enumerable language***: language defined by TM's using final state and halting are the same

- Equivalence of halting and accepting:
    - If $L = L(M)$, then there is a TM $M'$ such that $L = H(M')$
    - If $L = H(M)$, then there is a TM $M^{''}$ such that $L = H(M^{''})$

    - Proof: Final state -> Halting
        1. For each final state of $M$, remove any moves, so $M'$ will halt in that state
        2. *Avoid halt accidentally*:
            Introduce new state $s$, which runs to the right forever ($\delta(s, X) = (s, X, R)$)
            
            If $q$ is not a final state, and $\delta(q, X)$ is undefined, let $\delta(q,X) = (s, X, R)$

    - Proof: Halting -> Final State
        1. introduce new state $f$ for final state
        2. add new transition to avoid halt:
            If $\delta(q, X)$ is undefined, define it by $\delta(q, X) = (f, X, R)$

-----

## Programming Tricks:

#### Restrictions:

- **Semi-infinite Tape**:
    We assume TM never moves left from the initial position of the head(Only has infinity on one direction)
    
    But is *as powerful as original* Turing Machine
    
    To simulate infinite Tape by **State with cache** (2 track tape)
    $$
        \begin{matrix}
        X_0 & X_1 & X_2 & \cdots\\
        * & X_{-1} & X_{-2} &\cdots
        \end{matrix}
    $$ 

- Two stack can simulate one tape (PDA with 2 stack is TM)

- Left Move: TODO
- Right Move:

#### Extensions

- **Cache in State**:
Set state as $[q, X_1, X_2,\dots]$ (need be finite length vector)

- **Subroutines**:
    a set of states that perform some useful process. 
    - a start state 
    - and another state that temporarily has no moves and that serves as the "return" state to pass control to whatever other set of states
    
- **Multiple Track**:
    Some track represents data, some are mark

- **Multitape TM**: Allow TM to have $k$ tapes for any fixed $k$, and moving of the TM depends on the state and the symbols under the head of each tape(independence)

    Can simulate by one tape with $2k$ track (odd for tape-head mark, even for tape) (as powerful as origin)
    
    - Initial: The first tape with input and tape-head is at the left end of the input, and other tapes begin with blank symbols filled 
    - Transition: each tape-head moves independently and write tape symbols
    - Accepting: enter final state
    
    > finite control (state), finite tape

- **Nondeterministic TM**: set of choice (use tape as queue in BFS)
    - DTM $\to$ NTM:
        - first track: Store ID's on tape, for $ID_0 \to ID_1|ID_2$, add $\{ID_1, ID_2\}$ to the tail of tape, and move tape-head to next $ID_i$ (Queue in BFS). 
        > not DFS, shortest dist from start symbol. (always halt if NTM accept some input)
        - Second track: mark representing which $ID_i$ reading
    - set $k$ as the upper bound on the number of the choices of move of the NTM, thus and ID reachable from initial state with $n$ move, the constructed DTM has at most $\dfrac{k(1-k^{n})}{1-k} = \sum (k+k^2 + k^3+\cdots)$ ID's
    
#### Recursive Language

The class of language defined by TM is called *recursively enumerable languages*
> accept -> halt, otherwise unknown

But *recursive language*: always halt with yes or no as output (Algorithm)

##### Closure Properties of Recursive and RE language:

- Both closed under *union, concatenation, star, reversal, intersection, inverse homomorphism*
- Recursive closed under difference, complementation (need TM to return No)
- RE closed under homomorphism


## Decidability

Regular language $\subset$ CFL $\subset$ Decidable $\subset$ RE language $\subset$ All language