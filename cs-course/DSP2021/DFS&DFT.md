# DFS, DFT

- DFS: 周期离散
- DFT: 非周期序列做**周期延拓**($T = N$)，到DFS, 而后进行截取

> 卷积计算复杂度和多项式计算复杂度一致


----

## 信号的采样

> 主要是一些FT的推论的应用的性质，自然而然

#### 时域离散化

- 时域上进行采样: $X_s(t) = \sum_{n=-\infty}^{\infty} X(t)\delta(t-nT_s)$
- 根据乘法规则，化为频域上做卷积：
    $$
        \mathcal{F}[X_s(t)] = \frac{1}{2\pi} [X(j\omega) * \mathcal{F}[\delta_s(t)]] = \frac{1}{T_s} \sum_{n=-\infty}^{\infty} X(j(\omega - n\omega_s))
    $$
    
- 但是现实中不存在冲击信号，利用矩形信号 $P(t)$ 采样
    $$
        \mathcal{F}[x_s(t)] = \sum_{n=-\infty}^{\infty} P_nX(j(\omega - n\omega_s))
    $$
    
#### 频域离散化

TODO: Add noe

#### 采样和恢复

**时域采样定理**:

- *连续信号*$x(t)$ 为一个频带受限的信号 $|\omega| < \omega_m, \omega_m = 2\pi f_m$
- 做*等间隔*采样的结果 $x_s(t)$ 可以唯一表示(恢复) $x(t)$ 的条件为:
    $$
        T_s < \frac{1}{2f_m}, \quad or \quad \omega_s > 2\omega_m
    $$

> 换言之，在频域上的卷积的间隔足够的大使得没有overlap，而损失信息

----

## 调制、解调、滤波

> 频域视角下的信号特性和操作

- 通讯领域中需要对于信号进行升高频率(频分复用)

调制 $\xLeftrightarrow[\text{降}]{升}$ 解调

问题，给定信号的频率不符合传输条件的频域的要求，故而需要调制和解调

#### 调制解调

- Modulation: 低频信号*加载*或者*嵌入*到高频震荡信号上
- Demodulation: 从加载后的信号中提取出低频信号

$c(t)$ 的某一个参数要和 $x(t)$ 做规律变化:
- $A, \omega_c, \varphi, \theta(t)$
- $c(t) = A\cos(\omega_c t + \varphi)=  A\cos(\theta(t))$

- AM(Amplitude Modulation): 只有 $A$ 随 $x(t)$ **线性变化**
- FM, PM

##### AM

**正弦载波**

- $c(t) = \cos(\omega_c t)$
- $y(t) = x(t)\cdot \cos(\omega_c t)$

> $$
> \begin{align}
> \mathcal{F}(y(t)) &= \frac{1}{2\pi} [X(j\omega) * \pi[\delta(\omega + \omega_c) + \delta(\omega - \omega_c)]] \\
> \end{align}
> $$
>> 左右移动，幅度减半, 能量不变

**复指数载波调制**

- $c(t) = e^{j(\omega_c t +\varphi)}, \varphi =0$
    $$
        \begin{align*}
            \mathcal{F}(c(t)) &= \frac{1}{2\pi}[X(j\omega) * 2\pi[\delta(\omega-\omega_c)]]\\
            &= X(j(\omega - \omega_c))
        \end{align*}
    $$
    > 利用欧拉来做实部发生器和虚部发生器
    
- **单边带调幅**： 只发送上边带或者下边带信号，节省能量和带宽。(利用带通滤波器)

**同步解调**

从 $Y(j\omega)$ 中提取出 $X(j\omega)$

再次乘以$\cos(\omega_c t)$, 分为一个原信号和更为高频的信号

$$
    \begin{align*}
        r(t) &= y(t) \cdot \cos(\omega_c t) \\
            &= x(t)\cdot \cos^2(\omega_t) \\
            &= x(t)\left(\frac{1}{2}+\frac{1}{2}\cos(2\omega_c t)\right) 
    \end{align*}
$$

- 若有调制和解调相位不相等，则有 $r(t) = \frac{1}{2}x(t)\cos(\varphi -\theta) + \frac{1}{2}x(t)\cos(2\omega_c t +\varphi + \theta)$ , 也即失真


----

## 离散傅里叶变换 (DTFT - Discrete-Time Fourier Transform)

$$
    \begin{align*}
        x[n] &= \frac{1}{2\pi} \int_{2\pi} X(e^{j\omega}) e^{j\omega n} d\omega \\
        X(e^{j\omega}) &= \sum_{n=-\infty}^{\infty} x[n]e^{-j\omega n}
    \end{align*}
$$

> hint: 周期信号 $\tilde{x}[n]$ 的傅里叶级数 $a_k$ 可以用一个有限长的序列$x[n]$ 的傅里叶变换的等间隔样本来表示

注意到： 频率上相差 $2\pi$ 的复指数信号是一样的，也即 *$X(e^{j\omega})$ 是周期的*

> 一个 LTI 系统的频率相应是该系统单位脉冲响应的傅里叶变换 

#### DTFT 的性质

- 

- 帕赛瓦尔定理:
    $$
        \sum_{n=-\infty}^{\infty} |x[n]|^2 = \frac{1}{2\pi} \int_{2\pi} |X(e^{j\omega})|^2 d\omega
    $$
    

## FFT

TODO