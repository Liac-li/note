# 调制解调，滤波

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