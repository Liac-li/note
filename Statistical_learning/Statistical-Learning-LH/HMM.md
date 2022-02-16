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

给定了状态观测对$\{(O_1, I_1), \dots \}$, 直接利用**最大似然**

##### unsupervised learning(Baum-Welch Alg)

> EM

给定 $\bm{O}$ 求 $\lambda = (A, B, \pi)$, $P(\bm{O}|\lambda) = \sum_{\bm{I}}P(\bm{O|I},\lambda)P(\bm{I}|\lambda)$

- E步：
    $$
        Q(\lambda, \lambda_t) = \sum_{I} \log P(O, I|\lambda)P(O, I|\lambda_t)
    $$ 

    因为 $P(O, I|\lambda)$ 为已知形式的量， 为 
    $$
        \begin{align*}
        P(O, I|\lambda) &= \pi_{i_1}b_{i_1}(o_1)\cdot a_{i_1, i_2} b_{i_1}(o_2)\cdot a_{i_2,i_3}b_{i_3}(o_3)\dots\\
        &= \prod_{i} P(X_i = i_i)P(o_i|x_i)P(X_{i+1} = i_j|x_i) 
        \end{align*}
    $$
    
    所以Q函数形式转换为:
    $$
        \begin{align*}
        Q(\lambda, \lambda_t) &= \sum_{I}\left(\log \pi_{i_1} + \sum_{t=1}^{T-1}\log a_{i_t, i_{t+1}}+ \sum_{t=1}^{T}b_{i_t}(o_t)\right)P(O, I|\lambda_t)\\
        \end{align*}
    $$
    此处我们假设观测序列长度为 $T$, 之后我们做 $\lambda = \arg\max_{\lambda} Q(\lambda, \lambda_t)$
- M 步
    1. $\sum_I \log \pi_{i_1}P(O, i_1=i|\lambda_t)$
        做 langrage 乘子法得到一个Langrage函数:
        $$
            L(\pi_{i_1}, \alpha) = \sum_I \log \pi_{i_1}P(O, i_1=i|\lambda_t) + \alpha\left(\sum_{i=1}^N \pi_i - 1 \right)
        $$
        
        做偏导有

        $$
            \begin{align*}
                \frac{\partial L}{\partial \pi} &= \sum_{I}P(O, i_1 = i|\lambda_t)\frac{1}{\pi_{i_1}} + \sum_{i=1}^N \alpha = 0\\
                \Rightarrow & \\
                &\sum_{i=1}^N P(o, i_1 = i|\lambda_t) + \sum_{i=1}^N \alpha\pi_i = 0\\
                \Rightarrow & \\
                & \alpha = \frac{\sum_{i=1}^NP(O, i_1 = i|\lambda_t)}{\sum_{i=1}^N \pi_i} = -P(O|\lambda_t)
            \end{align*}
        $$
        
        带回原式子有 $\hat\pi_i = \frac{P(O, i_1=i|\lambda_t)}{P(O|\lambda_t)}$
    

#### Inference

##### 近似算法

##### Viterbi Algorithm
    