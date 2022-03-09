# Game 

Multi-person Decision Theory

**博弈要素**
- Players
- Strategies
- Payoff
- Information
- **Rationality**: 理性角色

Payoff Matrix: Matrix consist of payoffs of strategies of multiple players
Example: Prisoners' Dilemma

||confess|Don't confess|
|-|-|-|
|confess| -6 -6 | 0 -18|
|Don't confess| -18 0 | -1 -1|

> Each single optimal decision is not global optimum **No-cooperative**

## Game Theory

纳什均衡：任何一个玩家都没有动机做策略改变

## Chap 1: 策略式博弈和纳什均衡

收益 $actSpace1 \times actSpace2 \to \mathbb{R}$


#### Strategy Games

> Normal form game

**Regular form**

1. Full information 
2. non-cooperate

- A finite $N$ of players
- non-empty strategy set $A_i$
- a payoff function $u_i: A_1 \times A_2 \dots \to \mathbb{R}$

let $\bm{a} = (a_1, a_2,\dots, a_n)$ as the strategies vector called outcome

The payoff function can be replaced by a preference relation (partial order) $\preceq_i$ over $\mathcal{A}$ for each player $i$


#### Nash Equilibrium

$\bm{a} = (a_1, a_2, \dots, a_n)$, $\forall i \in [n]$
- $a_i$, 自己的策略
- $\bm{a}_{-i} = (a_1, \dots, a_{i-1}, a_{i+1}, \dots, a_n)$ 所有的对手的策略 

$\bm{a} = (a, \bm{a}_{-i})$

- $\mathcal{A}_{-i}$ all possible $\bm a_{-i}$ 

**Nash equilibrium**: 
a strategey outcome, is a best response to all other strategies

$$
    \bm{a}^*, s.t. \\
    u_i(a^*_i, a^*_{-i}) \ge u_i(a_i, a^*_{-i})\quad  \forall a_i \in \mathcal{A}
$$

- is self-enforcing; no player has an incentive to alter his strategy 


**How to get?**

1. select a player's strategy randomly to check its stability
2. then check the other one to get better payoff (move to better strategy)
3. turn to another, until reach the nash equilibrium 

The best response correspondence of player $i$ is given by:

- $B_i(a_{-i}) = \{a_i | u_i(a_i, a_{-i}) \ge u_i(b_i, a_{-i})\} \quad \forall b_i$, **$a_{-i}$ is fixed**
    - as set or singleton
    
$a^*_{i} = B(a^*_{-i})$