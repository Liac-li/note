# Chap10 - HMM

是一种关于时序的概率模型， 存在状态序列(state sequence)和由此生成的观测序列(observation sequence), 序列的每一个位置为一个时刻

- $Q = \{q_1, q_2,\dots ,q_N\}$: all valid state set
- $V = \{v_1, v_1\dots, v_M\}$: all valid observations
- $I = \{i_1, i_2, \dots, i_T\}$, state sequence with length $T$
- $O = \{o_1, o_2, \dots, o_T\}$, observation sequence
- $A = [a_{ij}]_{N\times M}$: 状态转移矩阵
- $B = [b_j(k)]_{N\times M}$: 观测概率阵

- Assumptions:
    - 齐次马尔可夫性：
        $$
            P(i_t|i_{i-1;0}, o_{t-1;0}) = P(i_t|i_{i-1}) 
        $$
    - 独立观测性:
        $$
            P(o_t|i_{t;0}, o_{t-1;0}) = P(o_t|i_t)
        $$
    
- Problems:
    1. get $P(\bm{O}|\lambda)$ given $\lambda=(\bm{A, B},\pi), \bm{O}$
        利用模型做推断或者是做模型检测
    2. given $\bm{O}$ $\lambda = \arg\max_\lambda P(\bm{O}|\lambda) $
        参数估计
    3. given $\bm{O}, \lambda$, get most probable $\bm{I}$


#### 模型性质

- Filtering: The task is to compute, *given the model's parameters and a sequence of observations*, the distribution over hidden states of the last latent variable at the end of the sequence.$P(i_t|\lambda, \bm{O})$

##### Forward Algorithm 


$$
    P(x_t|y_{1:t}) = \frac{P(x_t, y_{1:t})}{P(y_{1:t})}
$$

given $y_{1:t}$

we set $\alpha_t(x_t) = p(x_t, y_{1:t}) = \sum_{x_{t-1}}P(x_t, x_{t-1}, y_{1:t})$

$$
    \begin{align*}
        \alpha_t(x_t) &= p(x_t, y_{1:t}) = \sum_{x_{t-1}}P(x_t, x_{t-1}, y_{1:t})\\
        &= \sum_{x_{t-1}} P(y_t|x_t, x_{t-1}, y_{1:t-1})P(x_t, x_{t-1}, y_{1:t-1})\\
        &= \sum_{x_{t-1}} P(y_t|x_t, x_{t-1}, y_{1:t-1})P(x_t|x_{t-1}, y_{1;t-1})P(x_{t-1}, y_{1:t-1})\\
        &= \sum_{x_{t-1}} P(y_t|x_t) P(x_t|x_{t-1}) \alpha_{t-1}(x_{t-1})\\
        &= P(y_t|x_t) \sum_{x_{t-1}}P(x_t|x_{t-1})\alpha_{t-1}(x_{t-1})\\
    \end{align*}
$$

##### Backward Algorithm

set $\beta_{t}(x_t) = P(y_{t+1:T}|x_t)$

$$
    \begin{align*}
        P(y_{t+1:T}|x_t) &= \sum_{x_{t+1}}P(y_{t+1:T}, x_{t+1}|x_t) \\
        &= \sum_{x_{t+1}} P(y_{t+1:T}|x_{t+1}, x_t) P(x_{t+1}|x_t)\\
        &= \sum_{x_{t+1}} P(y_{t+1:T}|x_{t+1}) P(x_{t+1}|x_t) \\
        &= \sum_{x_{t+1}} P(y_{t+1}, y_{t+1: T}|x_{t+1})P(x_{t+1}|x_t) \\
        &= \sum_{x_{t+1}} P(y_{t+1}|x_{t+1})P(y_{t+1:T}|x_{t+1})P(x_{t+1}|x_t)\\
        &= \sum_{x_{t+1}} P(y_{t+1}|x_{t+1})\beta_{t+1}(x_{t+1})P(x_{t+1}|x_t)
    \end{align*}
$$

##### Problems:

1. $P(x_t | \bm{O}, \lambda)$: Filtering
    $$
        \begin{align*}
            P(x_t|o_{1:t}) &= P(o_t| x_t, o_{1:t-1})P(x_t|o_{1:t-1}) \\
            &= P(o_t|x_t)\sum_{x_{t-1}}P(x_t, x_{t-1}|o_{1:t-1}) \\
            &= P(o_t|x_t)\sum_{x_{t-1}}P(x_t | x_{t-1}, o_{1:t-1})P(x_{t-1}|o_{1:t-1}) \\
            &= P(o_t|x_t)\sum_{x_{t-1}}P(x_t|x_{t-1}) P(x_{t-1}|o_{1;t-1})
        \end{align*}
    $$
2. $P(x_{t+k}|\bm{O}, \lambda)$: Predict
3. $P(x_t|o_{1:T}, \lambda), t< T$: Smoothing

    $$
        \begin{align*}
        P(x_t|o_{1:T}) &= \frac{P(o_{1:T}, x_t)}{P(o_{1:T})} \\
        &= \frac{P(x_t,o_{1:t})P(o_{t+1:T}|x_t, o_{1:t})}{p(o_{1:T})} \\
        &= \frac{P(x_t, o_{1:t})P(o_{t+1:T}|x_t)}{P(o_{1:t})P(o_{t+1:T})}\\
        &\propto P(x_t|o_{1:t}) P(o_{t+1:T}|x_t) 
        \end{align*}
    $$
    
#### Learning 

##### supervised learning

##### unsupervised learning

#### Inference

##### 近似算法

##### Viterbi Algorithm
    