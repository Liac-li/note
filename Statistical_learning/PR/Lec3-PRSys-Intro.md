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

- 若有 $d(x, x_j) = d(x x_i)$ 如何确定分类 => 使用领域知识
- 如果出现离群点(outlier): 没有聚类到一起的点 => k-nn (k - hyper parameter)
- **能做的多好**? => 贝叶斯最优分类器, $n \to \infty$ 最近邻是最佳错误率的**两倍**
- bias: 类内聚集，类间稀疏
- cost： $O(d)$: 欧氏距离的计算，NN => $O(nd)$, K-nn => $O(nd) + O(n) + O(k)$
    - ANN $\hat{d}(x, x_i) < (1+\epsilon)d(x, x_i)$

