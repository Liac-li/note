# 抽样

#### 脉冲串样

定义脉冲序列 $\delta_{Ts}(t) = \sum_{n=-\infty}^{\infty} \delta(t-nTs)$, $Ts$ 为我们定义的时间间隔

> $y(t) = x(t)\cdot h(t) \xleftrightarrow{FT} X_y(j\omega) = \dfrac{1}{2\pi}[X(j\omega)*H(j\omega)]$

- $\mathcal{F}[\delta_{Ts}(t)]$, ($\omega_s= \frac{2\pi}{T_s}$)
    - FS
        $$
            X_n = \frac{1}{T_s}\int_{-T_s/2}^{T_s/2} \delta_{Ts}(t)e^{-j \omega_s t}dt = \frac{1}{T_s} \int_{-T_s/2}^{T_s/2}\delta(t)e^{-j\omega_s t} dt = \frac{1}{T_s}
        $$
    - FT
        $$
            X(j\omega) = 2\pi \sum_{n=-\infty}^{\infty} X_n\delta(\omega- n\omega_s) = \omega_s\sum_{n=-\infty}^{\infty} \delta(\omega- n\omega_s)
        $$
    
    $$
        \begin{align*}
            \mathcal{F}[x_s(t)] &= \frac{1}{2\pi} [X(j\omega)*\mathcal{F}[\delta_{Ts}(t)] \\
                &= \frac{1}{2\pi} [X(j\omega)*\omega_s \sum_{n=-\infty}^{\infty}\delta(\omega-n\omega_s)]\\
                &= \frac{1}{T_s}\sum_{n=-\infty}^{\infty} X(j(\omega-n\omega_s))
        \end{align*}
    $$
    > 时域上的采样也成为了在频域上的采样

- 实际上，只能使用一个时常极短的矩形信号来进行筹集信号的逼近
    有矩形脉冲的FS为 $P_n = \frac{1}{T_s}\int_{}^{}$
    
    $$
        \mathcal{F}[x_s(t)] = \sum_{n=-\infty}^{\infty}P_n\delta(j(\omega-n\omega_s))
    $$
    
#### 时域采样定理

- 频谱延拓
- 滤波：