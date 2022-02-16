# 拉普拉斯变化和z变换

拓展到全部复数域上的变换

## Laplace

直接定义为:
$$
  X(s) \dot = \int_{-\infty}^{\infty} x(t)e^{-st} dt \quad s\in \mathbb{C}
$$

$$
  x(t) = \frac{1}{2\pi j}\int_{\sigma+j\infty}^{\sigma-j\infty} X(s) e^{st} ds
$$

此处 $s = \sigma + j\omega$， 也即 $e^{-st}$ 是一个取遍复数数域上值

- 收敛域：FS 刻画了关于 $x(t)$ 的收敛性质，对应到$X(s) = \int_{-\infty}^{\infty} [x(t)e^{-st}]e^{-j\omega t}$, 为$x(t)e^{-st}$ 的收敛。故而拉普拉斯变换的收敛域取决于 $\sigma$ (收敛域定义在$\mathcal{Re}\{s\}$) 上
  易见，$\sigma \to \infty$, $x(t)e^{-st} \to 0$, 更容易收敛 
  
  - 一些收敛域的特例

|公式| 描述 |
|-|-|
|$\lim_{t\to \infty}t^n e^{-\sigma t} =0, (\sigma > 0)$|随时间的幂成正比增长的信号，收敛坐标落于原点|
|$\lim_{t\to\infty} e^{at}e^{-\sigma t} = 0, (\sigma > a)$| 指数增长的信号，收敛坐标与$a$有关|
||比指数增长的更快的函数，无法进行LT，如$e^{t^2}$ 或$te^{t^2}$ ，仅在有限时间为范围内LT存在|

LT 的一些性质: TODO

## Z

正如 DTFT 一样，Z 变换定义为:
$$
  x(\bm{z}) \dot = \sum_{n=-\infty}^{\infty} x[n] z^{-n}
$$
其中 $z = e^{j\omega}$ 使得 $|z|$ 没有必须等于1 的限制，也即$z$ 为一个任意复数，

- 收敛问题:
  $x(\bm{z}) = \sum_{n=-\infty}^{\infty} \{x[n]r^{-n}\}e^{-j\omega n}$, 也即可以在 DTFT 的视角下看待 $x[n]r^{-n}$ 的收敛情况。因为有 **$|z| = 1$ 时Z变换退化为DTFT**，也即是 $r = 1$的时候。
  可以想象对于一些$r$收敛，一些$r$不收敛，故而有 Z 变换的ROC都是以原点为中心的圆环

> 收敛域为圆环:
> $X(z) = X_{-}(z) + X_{+}(z)$, 其中 $X_{-}(z) = \sum_{n=-\infty}^{-1}x[n]z^{-n}$, $X_{+}(z) = \sum_{n=0}^{\infty} x[n]z^{-n}$
> ROC: $X_{-}(z) \to |z| < R_{-}$
> $X_{+}(z) \to |z| > R_{+}$

#### 逆变换

可以根据FT来做，有

$$
  \begin{align}
    x[n]r^{-n} &= \mathcal{F}^{-1} [X(re^{j\omega n})] \\
    \Rightarrow \quad x[n] &= r^n\frac{1}{2\pi} \int_{2\pi} X(re^{j\omega})e^{j\omega n} d\omega\\
    \Rightarrow \quad x[n] &= \frac{1}{2\pi} \int_{2\pi} X(\bm{z}) (re^{j\omega})^n d\omega\\
    \Rightarrow \quad x[n] &= \frac{1}{2\pi} \int_{2\pi} X(\bm{z}) (re^{j\omega})^n \frac{1}{j}\bm{z} d\bm{z} \\
    \Rightarrow \quad x[n] &= \frac{1}{2\pi} \oint_{r=r_0} X(\bm{z}) z^{n-1} d\bm{z}
\end{align}
$$

##### 分式方法

利用 Z 变换的线性性质拆分为几个 $x_i[n]u_i[n]$ 的组合

有LTI表示为一系列的差分方程：
$\sum_{k=0}^n a_k y[n-k] = \sum_{k=0}^M b_k x[n-k]$, 做一些 Z 变换之后，可以得到有:

$$
  \sum_{k=0}^n a_k z^{-k} Y(z) = \sum_{k=0}^M b_k z^{-k} X(z)
$$

而后一般的常有如下的分式表达：
$$
  \begin{align}
  X(z) &= \frac{\sum_{k=0}^M b_k z^k}{\sum_{k=1}^N a_k z^k}\\
    &= \frac{b_0(z-d_1)(z-d_2)\dots(z-d_M)}{a_0(z-c_1)(z-c_2)\dots (z-c_N)}
  \end{align}
$$

同时观察有:
1. $z = d_i$, $X(z) = 0$, 零点
2. $z \to c_i$, $X(z) \to \infty$, 极点

> Q: 单边 Z 和双边 Z 有什么区别？

离散系统的稳定性：
1. ROC：$H(z)$ 的收敛域包含单位圆则系统稳定
2. 极点：因果系统的极点全在单位圆内则该系统稳定

----------

**LTI 系统与傅里叶变换与指数输入**