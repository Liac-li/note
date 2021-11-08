# Fourier Transformation

#### 傅里叶变换的导出

此处假设有 $\hat x(t)$ 是以每个周期形如 $x(t)$ 组合而成的信号，且此处有 $\hat{x}(t) \xleftrightarrow{FS} a_k$

$$
    \begin{align}
        \hat{x}(t) &= \sum_{k=-\infty}^{\infty} a_k e^{jkw_0t}\\
        a_k &= \frac{1}{T}\int_{-T/2}^{T/2} \hat{x}(t)e^{-jkw_0t}
    \end{align}
$$
为FS的表示，此时易见有 $x(t)$ 为 $\hat{x}(t)$ 的一个周期，也即只有$(-T/2, T/2)$ 上有值，故而
$$
    a_k = \frac{1}{T}\int_{-T/2}^{T/2}\cdots = \frac{1}{T}\int_{-\infty}^{\infty} x(t) e^{-jk\omega_o t} dt
$$

此处定义 $Ta_k$ 关于 $\omega$ 的包络线 $X(j\omega)$ 为 

$$
    X(j\omega) = \int_{-\infty}^{\infty} x(t)e^{-j\omega t}dt
$$

则 $a_k = \dfrac{1}{T}X(jk\omega_0)$, 那么原信号可以用 $X(j\omega)$ 表示

$$
    \begin{align}
    \hat{x}(t) &= \sum_{k=-\infty}^{\infty} \frac{1}{T}X(jk\omega_0)e^{jk\omega_0 t} \\
        &= \frac{1}{2\pi} \sum_{k=-\infty}^{\infty} X(jk\omega_0)e^{jk\omega_0 t} \omega_0
    \end{align}
$$

**此时令 $T\to \infty$**, $\hat{x}(t) \to x(t)$, $\omega_0 =\frac{2\pi}{T} \to 0$

得到表达

$$
    \begin{align}
        x(t) &= \frac{1}{2\pi} \int_{-\infty}^{\infty} X(j\omega)e^{j\omega t} d\omega\\
        X(j\omega) &= \int_{-\infty}^{\infty} x(t)e^{-j\omega t}dt
    \end{align}
$$

则(4), (5) 我们称为 Fourier transform pair, $X(j\omega)$ 为 $x(t)$ 的FT 或 Fourier integral, (4) 为 inverse Fourier transform

> 注意，复指数信号族在 FS 中出现在离散的 $k\omega_0$ 上，而在FT上是在*连续*的频率域上
>> 在 FT 中，信号重构的系数为 $X(j\omega) \dfrac{d\omega}{2\pi}$

定义频谱密度:
$$
    X(j\omega) = \lim_{T\to \infty} X(nj\omega_0)T = \lim_{\omega_0\to 0} \frac{X(nj\omega_0)2\pi}{\omega_0}
$$

##### 收敛性:

1. $\int_{-\infty}^{\infty} |x(t)|^2 dt < \infty$
2. Dirichlet 条件

#### 一些特殊的信号的FT

- $x(t) = e^{-\alpha t} u(t)$, $X(j\omega ) = \dfrac{1}{\alpha + j\omega}, |X(j\omega)| = \dfrac{1}{\sqrt{\alpha^2+\omega^2}}$
- $x(t) = e^{-\alpha|t|}$ $X(j\omega) = \dfrac{2\alpha}{\alpha^2 + \omega^2}$
- $F[\delta(t)] = 1$
> 时域变化异常剧烈的冲激函数包含幅度相等的所有频率分量，这种频谱也称为“均匀谱”或“白色谱”
- $x(t)= 1$, $\mathcal{F}^{-1}[X(j\omega)] = \frac{1}{2\pi}\int_{-\infty}^{\infty} X(j\omega)e^{j\omega t}d\omega \Rightarrow \mathcal{F}^{-1}[2\pi\delta(\omega)] = 1$
    注意：直流信号不满足绝对可积条件，可用极限的方法求出傅里叶变换 $\mathcal{F}[1] = \lim_{\sigma \to 0}\mathcal{F}[1\cdot e^{-\sigma|t|}]$

>  对照冲激、直流时频曲线可看出:
    - 时域持续越宽的信号，其频域的频谱越窄
    - 时域持续越窄的信号，其频域的频谱越宽
    
#### FT 的性质

- 线性: $x_1(t)\xleftrightarrow{\mathcal{F}}X_1(j\omega), x_1(t)...$, $ax_1(t)+bx_2(t)\xleftrightarrow{\mathcal{F}}bX_1(j\omega) + bX_2(j\omega)$
- 对称特性：
    - $x(t)\xleftrightarrow{\mathcal{F}}X(j\omega)$,  $X(t)\xleftrightarrow{\mathcal{F}}2\pi x(-j\omega)$
    - 若 $x(t)$ 为偶函数， $X(t)\xleftrightarrow{\mathcal{F}}2\pi x(j\omega)$
- 奇偶虚实性: 在利用欧拉公式变换后实部和虚部分离
- 尺度变换特性： 
    $$
        x(t)\xleftrightarrow{\mathcal{F}} X(j\omega)  \longrightarrow \quad x(at) \xleftrightarrow{\mathcal{F}} \frac{1}{|a|}X(\frac{j\omega}{a}) $$
    也即表现为时域压缩，则频域拉伸；拉伸时域，则频域压缩
- 时移特性： $x(t-t_0)\xleftrightarrow{\mathcal{F}}X(j\omega)e^{-j\omega t_0}$

    **调制定理**：
    - $x(t)e^{j\omega_0 t} \xleftrightarrow{\mathcal{F}} X(j(\omega-\omega_0))$
    - $x(t)e^{-j\omega_0 t} \xleftrightarrow{\mathcal{F}} X(j(\omega+\omega_0))$
- 微分特性：
    $$
        x(t)\xleftrightarrow{FT} X(j\omega) \quad t^nx(t) \xleftrightarrow{FT} j^n\frac{d^nXj\omega}{d^n\omega}
    $$
    
TODO: 微分积分特性，卷积特性


    
    