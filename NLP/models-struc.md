# Notes

## Todo-List

- [ ] MLP
- [x] LSTM
  - [ ] variants of LSTM
- [ ] BERT
- [ ] Transformer
- [ ] DETR
- [x] RNN
  - [ ] calculate the gradient of twe direction RNN
- [ ] GRU
- [x] Page Rank
  - [ ] Perron-Frobenius 定理
- [ ] CNN

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

- TODO: implementation as Matrix Multiplication	

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