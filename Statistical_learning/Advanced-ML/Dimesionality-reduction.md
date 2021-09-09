# Chap 10 降维与度量学习

#### k-Nearest Neighbor, KNN

lazy learning 的代表-训练的时候啥都不做，测试的时候干活

- 实际应用中，是否可找到 k 近邻?

    在推导中，有假设 $P(c|x) \doteq  P(c|z)$ , 及要求样例是密集的 (bound set as $10^{-3}$)

- Dimension disaster

    高维后， 其一是空间个计算不方便，二是极为稀疏( $\cos$ 算后基本是垂直的 )

#### MDS (multiple Dimensional Scaling)

找到一个低维空间， 为一个保距映射 $\to$ 保持内积

##### Classical MDS

目的是保持内积的降维

距离表示内积 & 内积表示距离 (推导)

#### KL 变换 (PCA， eigen-face)

正交属性空间上的样本，做一个在超平面上对所有样本的恰当表达

目标超平面应有的性质
1. 最近重构性：样本呢到超平面上的距离足够近 (应该说是最少的信息损失)
2. 最大可分性：样本点投影之间分的足够开
    X 需要中心化？ 保证中心点在超平面上

> 样本之间的分布是有信息的：有些信息和超平面有关，有些无关

> inner product: $\vec{a}  \cdot \vec{b}$ , 理解为以 $\vec b$ 作为基准去度量 $\vec a$
> 2维平面上，可以用 $\vec{a}\cdot \vec{b}, \vec{a}\cdot \vec{c}$ 来蕴含所有的 $\vec{a}$ 的信息, 也就是对于响亮进行分解

> ? 如果理解到吧样本点分解都目标超平面上之类的