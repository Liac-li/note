# Lec1: Intro

# Information:

60(15 + ...) + 40(Final exam)

**Stochastic Process**

##### Example 1: 

From node $0$ and travel to left or right with equal probability on given circle.

Problem: What's the probability of  last visited node until visiting all nodes?

**Solution**:

- Target $E_i, i$ is the last visited node until visiting all nodes.
- Random variable: $T_k$: the first time that the particle visits $k$

$$
    \begin{align*}
    P(E_i) &= P(E_i|T_{i-1} < T_{i+1})P(T_{i-1} < T_{i+1})\\
        &\quad +P(E_i | T_{i-1} > T_{i+1}) P(T_{i-1} > T_{i+1}) \\
        & = P(W_m)P(T_{i-1} < T_{i+1}) + P(W_m)P(T_{i-1} > P(T_{i+1})) \\
        &= P(W_m)
    \end{align*}
$$

With  $\sum_{i}^m P(E_i) = 1 \to m * p(W_m) = 1 \to P(W_m) = \frac{1}{m}$

> Event $W_m$: a gambler who starts with 1 unit, and wins 1 when a fair coin turns up head and lose 1 when it turns up tails, will have hia fortune go up by $m-1$ before he goes broke

##### Example 2:

Particle with visit its neighbors with equal probability. What's the probability of the first visited leaf is on the ray $i$?

**Solution**:

- Target: $E_i$: the first visited leaf is on ray $i$
- Event $C_k$, the first visited ray is $k$

$$
    \begin{align*}
        P(E_i) &= \sum_{k=1}^r P(E_i | C_k) \cdot \frac{1}{r}\\
    1. k \neq i \\
        P(E_i | C_i) &= P(W_{n_i}) \cdot 1 + (1 - P(W_{n_i})) \cdot P(E _i) \quad \text{Wn 是一个在上述定义过的赌徒问题}\\
            &= \frac{1}{n_i} + (1 - \frac{1}{n_i})P(E_i) \\
    2. k \neq i &\\
        P(E_i | C_k) &= P(W_{n_k}) \cdot 0 + (1 - P(W_{n_k})) P(E_i)
    \end{align*}
$$

$$
    r P(E_i) = \frac{1}{n_i} + \sum_{k=1}^r (1 - \frac{1}{n_k}) P(E_i)
$$

$$
    P(E_i) = \frac{1/n_1}{\sum_{k=1}^r 1/n_k}
$$

#### Properties of Stochastic Process

For a SP $\{X_t | t=1,2, \dots, k\}$

1. **Independent Increments**:
    
    if $\forall t_0 < t_1 < t_2 < \cdots < t_n$, the random variables
        $$
            X(t_0) - X(t-1), X(t_2) - X(t_1),\cdots, X(t_n) - X(t_{n-1})
        $$
    are independent, we say the SP has independent increment property
    
2. A SP is said to have **stationary increments** if $\forall s > 0$, 
    $$
        X(t+s) - X(t)
    $$
    has te same distribution for all $t$
    
    > The increment is independent with the start time

#### Stochastic Process in AI

- Markov decision process:
- Hidden Markov Model;
- Gaussian Process(GP) Bayesian Optimization 无梯度优化
- Evolutionary Algorithm

## SP
**Independence of random variables**

$$
    P(\bigwedge_{i\in I}(X_i = x_i)) = \prod_{i\in I}P(X_i = x_i)
$$

**Expectation of random variable**

$$
    \mathbb{E}[x] = \sum_{x} x\cdot P(X=x)
$$

1. Let $X = X_1 + X_2 + \cdots$ then $\mathbb{E}[x] = \sum_{i=1}^n \mathbb{E}[X_i]$
    Linear property of expectation
2. $E[X] = E_Y[E_X[X|Y]]$
    $$
        \begin{align*}
            E[E[X|Y]] &= \sum_y E[X|Y=y]P(Y=y)\\
                &= \sum_y \sum_x xP(X=x|Y=y) P(Y=y)\\
                &= \sum_y \sum_x xP(X=x, Y=y)
                &= \sum_x xP(X=x)
                &= E[x]
        \end{align*}
    $$
    
Example 1:

Select keys to open door randomly from $n$ keys, X denote the number of selected keys until unlocking the door. Calculate $E[X]$ (without replacement)

Solution:

1. Be definitions
    $$
        \begin{align*}
            E[X] &= \sum_{k=1}^n k P(X=k)
        \end{align*}
    $$
    
    $$
        P(X=k) = \frac{n-1}{n} \frac{n-2}{n-1} \cdots \frac{1}{n-k-1} = \frac{1}{n}
    $$
    
    $$
        E[x] = \sum_{k=1}^n k \frac{1}{n} = \frac{n+1}{2}
    $$
    
2. Disassemble

    $$
        X_1 = \left\{
            \begin{align}
                &1, i-1 steps before not unlock the door\\
                &0, otherwise
            \end{align}
            \right.
    $$
    
    $$
        E[X_i] = \frac{n-1}{n}\frac{n-2}{n-1}\cdots \frac{n-(i-1)}{n-(i-2)} \\
            = \frac{n - i + 1}{n}
    $$
    
    $$
        E[x] = 1 + \sum_{i=2}^n \frac{n - i + 1}{n} = 
    $$
    
3. All expectation

    $$
        Y = \left\{
            \begin{align}
                1, & \text{第一次成功}\\
                0, &
            \end{align}
            \right.
    $$
    
    $$
        \begin{align*}
        E[x_n] &= \frac{1}{n} E[X_n|Y=1] + (1 - \frac{1}{n}) E[X_n|Y=0]\\
            &= \frac{1}{n} + (1 - \frac{1}{n})(1 + E[X_{n-1}]) \\
        \rightarrow\quad E[n] &= \frac{n+1}{2}
        \end{align*}
    $$