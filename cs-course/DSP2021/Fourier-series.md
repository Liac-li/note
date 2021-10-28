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

> Dirichlet 条件： 

##### 傅里叶级数的收敛条件

1. 能量条件 $\int_{-T/2}^{T/2} |x(t)|^2 dt < \infty$

TODO: Add note