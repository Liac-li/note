# Notes

## Todo-List

- [ ] MLP
- [x] LSTM
  - [ ] variants of LSTM
- [ ] BERT
  - [ ] fine-tuning based approach
- [x] Transformer
  - [ ] read the tf source code and modify
- [ ] DETR
- [x] RNN
  - [ ] calculate the gradient of twe direction RNN
- [ ] GRU
- [x] Page Rank
  - [ ] Perron-Frobenius 定理
- [x] CNN
  - [ ] Derivatives
- [ ] MLM
- [ ] OpenAI GPT


Project web [DIVE INTO DEEP LEARNING](https://d2l.ai/index.html)

----

## Recurrent Neural Network 

### Ques

- RNN use their internal state(memory) to process variable length sequences of inputs
  > Actually, RNN is much like RL, which introduce $x_{0:t-1}$ to the formula of $x_{t}$
- Maintain a sort of state (beyond the MLP)
- Seems RNN has some kind of connection with LSTM
- how to understand $\frac{\partial\bf{x}}{\partial\bf{x}}$​ <img src="http://latex.codecogs.com/gif.latex?\frac{\partial\bf{x}}{\partial\bf{x}}" />
not $1$​ but:
	
	$$
		\begin{bmatrix}
			\begin{bmatrix}
				1 & 0 & \cdots \\
				0 & 0 & \ddots
			\end{bmatrix} & 
			\begin{bmatrix}
				0 & 1 & 0 & \cdots \\
				0 & 0 & 0 & \ddots
			\end{bmatrix}
			& \cdots \\
			\begin{bmatrix}
			 0 & 0 & \cdots \\
			 1 & 0 & \ddots
			\end{bmatrix}
			& \ddots
		\end{bmatrix}
	$$

## Page Rank

- for $\pi = \pi P$, proof : $\sum_{i}\pi_i = 1$
- for $d\bm{P} + (1 - d)\bm{\frac{1}{N}}$, proof:
  1. $\pi = d\bm{P}\pi + \frac{1 -d}{n}\bm{1}$
  2. $\sum_{i}\pi = 1$

## Long Short-Term Memory

[LSTM_blog](http://colah.github.io/posts/2015-08-Understanding-LSTMs/)

### Notes:


- There is gap between information we need to use with the length the sequence need to check.
(RNN learn too long)(Long-term dependencies)
- Use a $\tanh( )$ to produce a vector? 
(Or like normalize a vector(limit 0~1)) 
- In normal LSTM, a same $x_t$ decide both the $C_{t-1}$ and $h_t$? 
- Why use $C_t = f_t * C_{t-1} + (1-f_t)*\bar C_{t}$,
while use $C_t = f_t * C_{t-1} + f_t*\bar C_{t}$ 

### Conclusion

LSTM 本质上就是引入了一个遗忘机制（gates layer），使得在RNN的基础上可以遗忘一部分的输入序贯。
($o_t$ 不是等概率的依赖$x_{0:t}$, 是添加了一个系数)(可以为$f_t = \sigma(x_t+b_t)$。
从而平衡了在过往和将来的的之间加入的不同的$x$, 即为很长的短(short-term)的记忆

## Convolutional Neural Network 

cs231n lecture [ConvNet](https://cs231n.github.io/convolutional-networks/)

### Tips 

- Why ConvNet but MLP
  > images may have pixel dependencies
  > ConvNet can capture the **Spatial** and **Temporal** dependencies

- ConvNet reduce images into easier to process form

- ConvNet layer: transforms 3D volume to 3D volume 
(may or may not have parameters)
	> CONV/FC has parameters
	> RELU/POLL not have parameters
-  Pooling:
  	- Max: performs as a noise suppressant
  	- Avg:

- how to get the matrix used in convolution 
- filter size must be full along the depth

#### Conv layer

- with parameters consist of a set of learnable **filters**
(learn some features)
- **Hyperparameter**: receptive field, or filter size, response to the input's local connectivity 
- Output size of a layer(1-dimension): $(W - F + 2P)/S + 1$, where:
	- $W$: input size
	- $F$: acceptive field
	- $P$: zero-padding, generally $P\triangleq (F - 1)/2, \, S = 1$
	- $S$: stride

- Implementation as Matrix Multiplication: **im2col** --> expand the matrix with and use matrix dot product 
- TODO: derivatives of Convolution layer [pdf](https://box.nju.edu.cn/lib/a57dee24-27c4-4d10-b8e2-6ad75564fec0/file/%E6%9C%AC%E7%A7%91%E8%AF%BE%E7%A8%8B/6.%E5%A4%A7%E4%B8%89%E4%B8%8B%E5%AD%A6%E6%9C%9F/%E6%A8%A1%E5%BC%8F%E8%AF%86%E5%88%AB%E4%B8%8E%E8%AE%A1%E7%AE%97%E6%9C%BA%E8%A7%86%E8%A7%89/%E8%AF%BE%E6%9C%AC/15_CNN.pdf)

## Transformer

Attention is all you need [arxiv-1706.03762](https://arxiv.org/abs/1706.03762)

Model code implement by Google-brain [tensor2tensor](https://github.com/tensorflow/tensor2tensor)

### Tips

- ? Encoder and Decoder in CNN & RNN
  - why use sub-layer: one is attention layer, and a FFN, I think it used to activate some specific point data, which is important and worth pay attention to 
  - modify self-attention in Decoder stack to prevent position from attending to subsequent positions 
  - output need to shift right, to let position $i$ only depend on the $1:i$ ?, and how to implement it
- attention mechanisms used in conjunction with RNN: different method and theory
- **Distance** -- key, operations is constant number with distance growing (**Position encode, attention layer**)
- ? what means encoder decoder *stack*

### Attention

#### Scaled Dot-product attention

- why compute $Q, K, V$ simultaneously
- why dot-product can be called as *attention function*
- how additive attention works

#### Multi-head attention

- ? perform attention function on projected $Q, K, V$ parallel
- ? divide whole matrix into different part to compute
- allows the model to jointly attend to information from different representation subspaces at different positions

### In [tensorflow demo](https://www.tensorflow.org/text/tutorials/transformer)

- $Q, K,V$ initialize:

| layer              | $Q$     | $K$     | $V$      |
|--------------------|---------|---------|----------|
| encoder-multihead  | $x$       | $x$       | $x$        |
| decoder-multihead1 | $x$       | $x$       | $x$        |
| decoder-multihead2 | enc-out | enc-out | dec-out1 |

- Encode & Decoder training: train the same model with same input and mask
- TODO: finish ternsorflow demo and modify it

### Conclusion

Transformer 的重点就是在于利用一个注意力机制和位置编码来并行化之前的基于序列的序列的较长的长度的问题，同时也是减少了一些并行训练下的参数数量。

但是不理解的是其结构的设计究竟有何道理，如encode和decode的结合，多次的multihead-attention层的使用，都令人不是很理解，可能需要玩一玩代码。

## BERT: Bidirectional Encoder Representation from Transformers

src code [github-bert](https://github.com/google-research/bert)

### Tips

- Pretrain, jointly conditioning on both left and right context on all layer, unlabeled text
- ? *next sentence prediction*  jointly with *pretrains text-pair representation*
- ? unlike [Radford et al.(2018)](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf), BERT build a **deep** pre-train bidirectional network
- ? heavily-engineered task-specific architecture 
- ? unified architecture across different tasks 
- ? down-stream tasks

### Pre-train

- on unlabeled data over different tasks
- with 2 tasks:
  1. Masked LM
  2. Next Sentence Prediction (NSP)

#### Masked LM

- mask some percentage of input randomly : allow only predict the masked words rather than reconstructing the entire input
- ? why need masked  

#### NSP

- QA and NLI need the *relationship* between two sentences, which is not directly captured by language model

### Fine-tuning

- base on pretraining parameter, all of which are fine-tuned using labeled data
- encoding a concatenated text pair with self-attention effectively including bidirectional cross attention between two sentences

---

## About numpy index

Numpy 有高级所以和低级索引，有几个显著的区别：

1. 高级索引是一个`copy()`, 而低级索引返回的是一个`view`
2. 低级索引主要理解为切片，或者别的，而高级索引了解为行和列的对应

同时，高级索引和低级索引混合的时候，要格外注意返回的`array`的形状(详情见文档[numpy-doc-array](https://numpy.org/doc/stable/reference/arrays.indexing.html#combining-advanced-and-basic-indexing))

---

## Math

- Relu function:
	$$
		f_{relu} \triangleq \max (0, x)
	$$
and relu function is nonlinear