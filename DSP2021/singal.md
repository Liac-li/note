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

#### 常见的离散信号

? 基本的离散序列的理解 (PPT-22)

**周期性的性质与连续信号有显著的不同**， 这还是采样的问题

- 单位信号
- 单位阶跃：(unit step)
    $$
        u[n] = \left\{\begin{aligned} 1, \, n\ge 0 \\
            0, \, n < 0
        \end{aligned} \right.
    $$
## 信号的变化

- 尺度变换 $x(t) \to x(at)$ with $t > 0$
    $a > 1$ 压缩，反之
- 信号的反转 $x(t) \to x(-t)$
- 时移 $x(t) \to x(t + t_0)$
- 信号的乘法与加法：
    - $x(t) = x_1(t) \cdot x_2(t)$， 使用一些作为窗口信号来进行筛选
