# Chap 10 降维与度量学习

#### k-Nearest Neighbor, KNN

lazy learning 的代表-训练的时候啥都不做，测试的时候干活

- 实际应用中，是否可找到 k 近邻?

    在推导中，有假设 $P(c|x) \doteq  P(c|z)$ , 及要求样例是密集的 (bound set as $10^{-3}$)
- 关于西瓜书上的 $P(err) \leq 2\times (1 - P(c^*|x))$
    1. 假设了 $P(c|x) \approx P(c|z)$ 也就是说强调了样本空间比较的密集
    2. 最差是 Bayesian 最优分类器的 error 两倍没有啥意思 20% -> 40%

- Dimension disaster

    高维后， 其一是空间内计算不方便，二是极为稀疏( $\cos$ 算后基本是垂直的 )

#### MDS (multiple Dimensional Scaling)

找到一个低维空间， 为一个保距映射 $\to$ 保持内积

若有样本之间的内积矩阵为 $\bm{B}$
可以有： $\bm{B = V\Lambda V^\top}$, 做特征谱 $\bm{Z} = \bm{\Lambda_*^{1/2}V_*^{1/2}}$, 去除掉一些小的特征值 (谱是一个长尾分布的)

##### Classical MDS

目的是保持内积的降维

距离表示内积 & 内积表示距离 (slides 上所展示的公式中，所有的样本点已经**中心化**)

#### KL 变换 (PCA， eigen-face)

正交属性空间上的样本，做一个在超平面上对所有样本的恰当表达

目标超平面应有的性质
1. 最近重构性：样本呢到超平面上的距离足够近 (应该说是最少的信息损失)
2. 最大可分性：样本点投影之间分的足够开

    X 需要中心化？ 保证中心点在超平面上

> 样本之间的分布是有信息的：有些信息和超平面有关，有些无关

> inner product: $\vec{a}  \cdot \vec{b}$ , 理解为以 $\vec b$ 作为基准去度量 $\vec a$
> 2维平面上，可以用 $\vec{a}\cdot \vec{b}, \vec{a}\cdot \vec{c}$ 来蕴含所有的 $\vec{a}$ 的信息, 也就是对于响亮进行分解

> ??? 如果理解到吧样本点分解都目标超平面上之类的
>> PCA 理解成一个投影

**重构阈值**: $\dfrac{\sum_{i=1}^{d'}\lambda_i}{\sum_{i=1}^{d}\lambda_i} \ge t$ , 如 $t = 95\%$, 选取最小的 $d'$ 使之成立

#### 非线性降维

Intrinsic Space, 更为本质的表现数据的空间

- 核方法 (KPCA)
- 流形学习 (manifold learning)

##### KPCA

对于核矩阵进行特征值分解

> TODO: kernel CCA, LDA

##### ISOMAP (manifold learning)

??? 如何找到流形空间内的距离 - 测距地距离

1. 全局建模
2. ISOMAP 方法
    - 构造近邻图
    - 基于最短路径宣发近似任意两点的测地线(geodesic)距离
    - 利于最短距离矩阵做MDS得到低维潜入
    
    > 折线逼近


#### LLE (locally linearly embedding)

在高维空间中利用近邻集合的一个**重构系数** $w$ ，在低维空间中保证重构系数 $w$

$$
    \min_{w_1, w_2,\dot, w_m} \sum_{i=1}^m \left\|x_i - \sum_{j\in Q_i}w_{ij}x_j\right\|_2^2 \qquad s.t.\quad \sum_{j\in Q_i}w_{ij} = 1
$$
最小化重构误差

##### 距离度量学习 (distance matric learning)

> 学出合适的基

1. 一个可以参数化的距离公式：(马氏距离)
