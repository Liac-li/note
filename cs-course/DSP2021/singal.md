# 信号

## 信号的种类

#### 信号的分类

##### 周期

- 定义： $\forall t \in \mathbb{R}, \exist T, s.t. x(t + T) = x(t)$, 最小的那个 $T$ 称为基波周期(fundamental period)
- $T_1, T_2$ 本别是 $x(t), y(y)$  的周期，若有 $T_1/T_2$ 为有理数，则信号之仍然为一个周期信号 (保证了 $T_1, T_2$ 的具有一个最小公倍数)
- 周期信号和非周期信号都可能分解为周期信号

此处可以注意离散的信号序列可以视为一个**连续**(包络)信号和**周期脉冲**的乘积，*也可视为采样*
故而有离散周期与其周期脉冲和连续信号的周期性有关

##### 能量与功率

||连续信号|离散信号|
|--|---|---|
|能量| $W = \lim_{T \to \infty} \int^T_{-T} \lvert x(t)\rvert^2 dt$ | $W = \lim_{N \to \infty} \sum^N_{-N}\lvert x[n]\rvert^2$ |
|功率| $P = \lim_{T \to \infty} \frac{1}{2T}\int^{T}_{-T}\lvert x(t)\rvert^2 dt$ | $P = \lim_{N\to\infty} \frac{1}{2N+1} \sum^N_{-N} \lvert x[n]\rvert^2$ |

- 能量信号: $W \in (0, \infty),\, P = 0$
- 功率信号: $W \to \infty, P\in(0, \infty)$

> 能量信号和功率信号相悖
> ? **周期信号都是功率信号**, 非周期可能是功率，也可能是功率信号

**因果信号**： $t<0, f(t) =  0, \quad t > 0, x(t) \neq 0$

#### 基本连续信号

- 直流信号
- 正弦信号
- 实指数信号： $x(t) = Ae^{\alpha t}$
- 虚指数信号：$\alpha$ 为一个纯虚数

  若 $A = 1$,  $x(t) = e^{j\omega_0 t}$

  **周期**： $\omega_0 T_0 = 2\pi k$, therefore   $T_0 = \dfrac{2\pi}{|\omega_0|}$, 当 $\omega_0 \neq 0$

  利用一些欧拉公式 $e^{j\omega_0 t} = \cos \omega_0t + j \sin \omega_0 t$

  > 谐波信号(harmonically) $\{e^{j\omega t}, e^{j2\omega t}, \dots\}$

- 复指数信号：$x(t) = Ae^{st}$， $s$ 为复数
    $A$ 使用极坐标表示: $A = |A|e^{j\theta}$ , $s$ 使用笛卡尔坐标: $s = r + j\omega_0$
    $$
        x(t) = Ae^{st} = |A|e^{j\theta}e^{(r+j\omega_0)t} = |A|e^{rt}e^{j(\omega_0t + \theta)}
    $$
    我们可以称为 $|A|e^{rt}$ 为包络，$e^{j(\omega_0t + \theta)}$负责震荡

    来点欧拉公式可以有:
    $$
        x(t) = |A|e^{rt}\cos(\omega_0t+\theta) + j|A|e^{rt}\sin(\omega_0t + \theta)
    $$

- 抽样信号: $Sa(t) = \frac{\sin t}{t}$
    - $Sa(0) = \lim_{t\to 0}\frac{\sin t}{t} = 1$
    - $Sa(k\pi) = 0$
    - $\int^{\infty}_{-\infty} Sa(t) = \pi$，关注一下三角部分

- 冲击信号(impulse response):(极限模型) $\delta(t) = \lim_{\Delta \to 0}f_{\Delta}(t)$
    > 冲击信号的极限性质**重要**

    面积为 1, 在 $\Delta\to 0$. 只在 $t = 0$ 处有值

    Direct 定义：
    $$
        \begin{aligned}
        & \delta(t) = 0, t\neq 0\\
        & \int_{-\infty}^{\infty}\delta(t)dt = 1
        \end{aligned}
    $$

    - 具有强度: $\delta(t)$ 对于时间的定积分值
    - 可以表示**其他任意信号**或表示信号**间断点的导数**
    - 展缩特性: $\delta(\alpha t) = \frac{1}{|\alpha|}\delta(t), (\alpha\neq 0)$
    - 抽样性质： $x(t) \delta(t-t_0) = x(t_0)\delta(t-t_0)$ 

        ??? 利用Dirac的定义？
    - 信号的冲激表示: $\int_{-\infty}^{\infty} x(t)\delta(t-t_0) = x(t_0)$
        其中令 $t = \tau, t_0 = t$ :
        $$
            \int_{-\infty}^{\infty} x(\tau)\delta(\tau - t)d\tau = x(t)
        $$ 
        > 注意比较离散信号的单位脉冲表述




#### 常见的离散信号

- 实指数序列: $x[n] = Ar^n$
    
    若令 $r \doteq e^{\beta}, x[n] = Ae^{\beta n}, n \in \mathbb{Z}$
- 虚指数序列: $x[n] = e^{j\omega_0n}$

    日常来的点欧拉： $e^{j\omega_0 n} = \cos \omega_0n + j\sin \omega_0n$
    $$ A\cos(\omega_0n + \phi) = \frac{A}{2}e^{j\phi}e^{j\omega_0n} + \frac{A}{2}e^{-j\phi}e^{-j\omega_0n} $$
- 复指数序列： $x[n] = Az^n = |A|e^{j\theta}(|z|e^{j\omega_0})^n$

    再来点欧拉:
    $$
        |A|e^{j\theta}(|z|e^{j\omega_0})n \\
        = |A||z|\cos(\omega_0n + \theta) + j|A||z|\sin(\omega_0n + \theta) 
    $$

##### 周期性问题

可以有看到虚指数序列 $e^{j(\omega_0 + 2\pi)n} = e^{j\omega_0n}e^{j 2 \pi n} = e^{j\omega_0 n}$

也就是说，在离散的序列中，会应为欠采样的问题导致对于频率的增加而没有体现出来的问题

**周期性的性质与连续信号有显著的不同**， 这还是采样的问题

- 单位信号: (unit impulse)
    $$
        \delta[n] = \left\{
            \begin{aligned}
                1, \, n = 0 \\
                0, \, n \neq 0
            \end{aligned}\right.
    $$
    - $x[n]\delta[n] = x[0]\delta[n]$, 易见
    - $x[n]\delta[n-n_0] = x[n_0]\delta[n-n_0]$, 令 $n - n_0 = 0$, 易见
    - 用单位信号的位移来离散的表示任意**离散信号**
- 单位阶跃：(unit step)
    $$
        u[n] = \left\{\begin{aligned} 1, \, n\ge 0 \\
            0, \, n < 0
        \end{aligned} \right.
    $$

##### 信号的差分

做差 (？有啥用)
||一阶 |二阶|
|-|-|-|
|前向差分 $\Delta x[n]$ | $\Delta x[n] = x[n+1] - x[n]$ | $\Delta^2 x[n] = \Delta(\Delta x[n])$ |
|后向差分 $\nabla x[n]$ | $\nabla x[n] = x[n] - x[n-1]$ | $\nabla^2x[n] = x[n] - 2x[n-1] + x[n-2]$ |

## 奇异信号

信号本身或者其导数具有**不连续**点(跳变)
> 也就是说不考虑离散的 ?

##### 信号的微分

利用冲激信号来进行突变的信号不连续点的导数的表示

## 信号的变化

- 尺度变换 $x(t) \to x(at)$ with $t > 0$
    $a > 1$ 压缩，反之
- 信号的反转 $x(t) \to x(-t)$
- 时移 $x(t) \to x(t + t_0)$
- 信号的乘法与加法：
    - $x(t) = x_1(t) \cdot x_2(t)$， 使用一些作为窗口信号来进行筛选

## 信号的分解

- 脉冲分量，分解为一些列冲激信号之和 $x(t) = \int_{-\infty}^{\infty}x(\tau)\delta(\tau-t)d\tau$
- 离散信号，一系列单位脉冲信号之和 $x(t) = \sum_{k=-\infty}^{\infty} x[k] \delta[x-k]$

#### 信号的向量化

| Name | 数学表达 |
| ---- | ------- |
| 强度 | $\|x\|_1 = \int_{-\infty}^{\infty} \lvert x(t)\rvert dt $ |
|  能量 | $\|x\|_2 = \sqrt{\int_{-\infty}^{\infty}\lvert x(t) \rvert^2dt}$ |
| 峰值 | $\|x\|_0 = \sup \lvert x(t)\rvert$ |
|内积| $<x_1(t), x_2(t)> = \int_{-\infty}^{\infty}x_1(t)x_2(t)dt$ |
|| $\|x\|_2 = <x(t), x(t)>$ |

**利用一族正交函数**分解

$x_1(t) = c_{12}x_2(t)$ 在 $(t_1, t_2)$ 上表示

$$
    \min_{c_{12}} \epsilon^2 = \frac{1}{t_2 - t_1}\int_{t_1}^{t_2} [x_1(t) - c_{12}x_2(t)]^2 dt
$$

let $\frac{\partial \epsilon}{\partial c_{12}} = 0$, get $c_{12}^* = \dfrac{\int_{t_1}^{t_2}x_1(t)x_2(t)}{\int_{t_1}^{t_2}x_2(t)} = \dfrac{<x_1, x_2>}{<x_2, x_2>}$

if $<x_1, x_2> = 0$ 则其正交

作**一族**正交基 $g_1, g_2, \dots, g_n$ , $x(t) = \sum_{r=1}^n c_rg_r(t) = \bm{c_r}\bm{g}(t)$， and $c_r = \dfrac{<x(t), g_r(t)>}{K_r^2}$

- 帕萨瓦尔定理： $\int_{t_1}^{t_2} x^2(t)dt = \sum_{r}^{\infty} c_r^2$, 且  $c_r$ 是**一组完备的正交基**的表示系数

> $<g_1, g_2, \dots, g_n>$ 完备也即不存在 $g(t)$ 使得
> 1. $<g(t), g_r(t)> = 0, r=1, \dot, n$
> 2. $0 < \int_{t_1}^{t_2} g(t)dt < \infty$
>> 常见的有：三角函数集， 复指数函数集， Rademacher函数集 ($r_k(t) = \text{sign}\sin2^k\pi t$)

**奇偶分解**

$x(t) = x_e(t) + x_o(t)$

$x_e(t) = \frac{1}{2}[x(t) + x(-t)], x_e(-t) = -x_e(t)$

$x_o(t) = \frac{1}{2}[x(t) - x(-t)], x_o(t) = -x(-t)$

## Euler's Formula

$\forall x \in \mathbb{Q}, e^{ix} = \cos x + i\sin x$, 可以注意到 $\forall x \in \mathbb{C}$ 仍然成立

容易的通过加减推出

- $$ \sin x  = \dfrac{e^{ix} - e^{-ix}}{2i} $$
- $$ \cos x = \dfrac{e^{ix} + e^{-ix}}{2} $$

##### 在复数中的推理

不妨有 $z \in \mathbb{Z}, \, z = x + iy$

在复平面的极坐标视角中有：

$$
    \begin{aligned}
        z &= x + iy \\
        &= |z|\cos \theta + (|z|i) \sin\theta \\
        &= |z| (\cos\theta + i\sin\theta)
        &= |z| e^{i\theta}
    \end{aligned}
$$

## 练习

1. 画出 $x(t) = e^{j2t} + e^{j3t}$ 的模

    模必然为1, 为一个螺旋线， 周期为 $2\pi$
2. 是否为周期信号 
    - $x_1[n] = \cos(n\pi / 6)$ 是， $N = 12$
    - $x_2[n] = \cos(n/6)$ 是， $N = 12\pi$
3. $T$ 为常数， $\omega_0 =\frac{2\pi}{T}$
    - $x(t) = t[u(t) - u(t-T)]$, 从$0\to T$ 的自 $0 \to T$ 的线性函数
    - $x(t) = \sin\omega_0t\cdot[u(t)-u(t - T)]$, 在 $0 \to T$ 上的完整的一个周期为 $T$ 的 $sin$ 函数

    可以把 $u(t) - u(t- T)$ 理解为一个选择子