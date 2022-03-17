1. 工作有什么贡献和改进
2. 工作有实际应用的可能性吗
3. 工作的逻辑性和可解释性是如何来的


## 刘子涵 - 文档翻译中的模型推理能力

文档翻译中的一致性问题

- 机器翻译中关注的是目标端的一致性，而不是源端的一致性。

> NMT 模型
> G-transformer with Attention Regularization

- 通过在新的数据集上再训练进行模型微调 (fine-tune)；在数据上进行再次采样

> Q: 模型的推理能力如何证明

## 王人杰 - 基于半监督的情感三元组的

> DataSet: SemEval - 1000 ； 一个很小的数据集

- 属性；意见(来自数据)；情感极性(预测)

1. Tagging: 使用 Span 的矩阵进行匹配
2. QA: MRC (Machine Reading Comprehension) 
3. Generation: 生成 "It is [sentiment] because [aspect] is [opinion]" 