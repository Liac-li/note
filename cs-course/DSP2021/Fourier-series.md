# 信号的傅里叶级数

利用微分积分求解系统过于复杂，利用某些**特殊信号**的系统的响应来观察系统(卷积)
- 冲击信号：卷积 ( $x'(t) \to x(t), y'(t) \to y(t)$ )
- 指数信号： ？ 

**指数信号的特殊性**：是LTI的特征信号 ??? (3.2)
> $Ax = \lambda x$
> $f(e^{j\omega t}) = \lambda e^{j\omega t} $ 
>> 做卷积的时候可以还原出一个 $e^{jwt}$

复数信号的内积需要取出共轭信号
积

#### 傅里叶级数的定义与信号的重构

三角函数族级( $\{\cos n\omega t, \sin n  \omega t\}$ ) $\Leftrightarrow$ 指数函数族级 ( $\{e^{jn\omega t}\}$ )

有 $\|\sin n\omega t\|_2^2 = \|\cos n\omega t\|_w^2 = \frac{T}{2}, <1, 1> = T$


**信号重构的傅里叶级数**(基于内积)
||参数|表达式|
|-|-|-|
|三角函数|$a_0 = \frac{<x,1>}{<1,1>}, a_n=\frac{<x,\cos n \omega t>}{<\cos n \omega t,\cos n \omega t>}, b_n=\frac{<x, \sin n \omega t>}{<\sin n \omega t,\sin n \omega t>}$|$x(t) = a_0 + \sum_{n=1}^\infty a_n\cos n\omega t + \sum_{n=1}^\infty b_n \sin n\omega t$|
|指数函数|$X_{n} = \frac{x, e^{jn\omega t}}{e^{jn\omega t}, e^{jn\omega t}}$| $x(t) = \sum_{n=-\infty}^\infty X_n e^{jn\omega t}$ |

> $X_n = \frac{1}{2}a_n + \frac{j}{2}b_n$

> 吉布斯(Gibbs)现象： 三角函数用来拟合信号会出现震荡

##### 傅里叶级数的收敛条件

当$n$足够大的时候，利用傅里叶级数表示的新的组合形式可以收敛到目标函数上

1. 能量条件 $\int_{-T/2}^{T/2} |x(t)|^2 dt < \infty$
    注意：只能保证FS和原信号在能量上没有差别，而不不保证在每一个$t$上的取值都等
2. Dirichlet 条件:
    - 任何周期内，$x(t)$*绝对可积* $\int_T |x(t)|dt < \infty$
    - *任意有限区间*内，只有*有限个*不连续点，且在这些点上都是*有限*值
    - *任意有限区间*内，只有有点个极大值和极小值
3. 对于一个不存子啊任何间断点的周期信号，FS收敛

#### FS的性质

##### 连续信号

- 线性性质: $x(t), y(t)$ 具有**相同周期**$T$, 有 $ax(t)+by(t) = a\alpha_x + b\alpha_y$
- 对称性质：
    - 偶信号$x(t) = x(-t)$， FS只有直流分量和余弦分量
    - 奇信号$x(t) = -x(-t)$, FS只有正弦分量
    - 奇谐(半波镜像)$x(t) = -x(t\pm\frac{T}{2})$, 只有奇数项正弦和余弦信号
    - 偶谐(半波重叠)$x(t) = x(t\pm\frac{T}{2})$, 只有偶数项正弦和余弦信号
- 相乘: $x(t)y(t) \xleftrightarrow{FS} h_k = \sum_{l=-\infty}^\infty a_lb_{k-l} $ 卷积    
- 帕塞瓦尔定理: 
    $$
        \frac{1}{T}\int_t |x(t)|^2dt = \frac{1}{T}\int_T |X_n e^{jn\omega t}|^2dt = \sum_{n=-\infty}^\infty X_n^2
    $$
