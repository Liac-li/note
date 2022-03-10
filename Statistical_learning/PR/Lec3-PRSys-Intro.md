# Lec3 : 模式识别系统概述

> PR整体的框架

**统计学习 & DL**

- DL 已经高度分化 + 各种子领域的子问题 
    - 大模型预训练 / 小模型压缩
    - loss function + evolution

- Inductive Bias： LE => 具有线性特征的数据的， CNN => 我不好说
CAM： 前背景分离 pre-trained module + finetune
- Bias-variance decomposition: 最坏下界

## 最近邻原则

- 若有 $d(x, x_j) = d(x, x_i)$ 如何确定分类 => 使用领域知识
- 如果出现离群点(outlier): 没有聚类到一起的点 => k-nn (k - hyper parameter)
- **能做的多好**? => 贝叶斯最优分类器, $n \to \infty$ 最近邻是最佳错误率的**两倍**
- bias: 类内聚集，类间稀疏
- cost： $O(d)$: 欧氏距离的计算，NN => $O(nd)$, K-nn => $O(nd) + O(n) + O(k)$
    - ANN $\hat{d}(x, x_i) < (1+\epsilon)d(x, x_i)$

## PR 系统

数据获取 -> 提取特性(手动；机器) -> 学习 -> 评价评估
or
DL = 特征学习 + 学习

- acc 的前提 i.i.d
    $$
        \mathbb{E}_{(x,y) \sim p(x, y)} [f(x) \neq y]
    $$
    
    Test Data & Training data 都是从真实的 $P(x, y)$ 采样的 (模型是有效的，可泛化的)
- Target: 模型分对了无代价，分错了有代价 (model evolution)

**Training**

- Underfitting: 模型的复杂度不足
- Overfitting: 模型复杂度过高
    - 对于噪声数据学习过多
    - 或者说是关键特征的权值不足
    - 或者在训练集不够大的时候，学习训练集的特征
    
Solve: Regularization
- Regularization 可以降低模型的复杂度 (PRML, ESL) 
    TODO
    
**Testing**

- 在训练集过小的情况下?
    - 交叉验证：对于数据多次训练，对于acc取平均; 也就是只是为了测试模型的性能，而不是为了得到最优的模型
    
> Imbalance Learning; cost-sensitive learning

- AUC-ROC
    - 调整评级阈值在同一个模型上获得一个曲线
    - 非减的👍: 对于阈值上升，有且只有增大的可能性
    - 面积：在 y 轴上的平均值
    - 对角线: 随机模型
    
F1 score: Precision & recall 都均衡 (最大在 $(0.5, 0.5)$)

- AUC-PR: 更为的强力


