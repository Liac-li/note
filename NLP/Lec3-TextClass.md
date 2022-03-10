# 文本分类

## Naive Bayesian

- $\bm{w}$ one-hot vector of vocab dictionary
- Target: $P(\bm{w} | \bm{c})$ $\bm{c}$ for cat

- Estimate likelihood: $\hat{P}(\bm w | \bm c) = \frac{n(\bm{w}_t)}{N_k}$ $n(w_t)$ number of class with $\bm{w}$ observed, $c_k$ total documents in $c_k$

## Text Rep

#### Symbolic Encoding

##### Ont-hot (Bag of words)

**Disadvantage**:
1. all word vectors are orthogonal (Independence)
2. all word with same weight
3. Too large dimension

> Features:
> Negative, etc.

#### Distributed representation

> Shrink the large dimension of Bag-of-word, change the distribution of all words, to have some similarity between words

*We can get a lot of value by representing a word by means of its neighbors*

##### Latent Semantic Index

> Use context to represent a word
> LSA ??? 

- Use **co-occurrence** Matrix
    - $\bm{X}\in \mathbb{R}^{n\times m}$ word-document matrix: row for words, columns for documents
    
    - $\bm{XX^T}\in \mathbb{R}^{n\times n}$: similarity between words
    - $\bm{X^TX}\in \mathbb{R}^{m \times m}$
    
- To represent the term-document space by a **lower dimensional latent space**
    - Use SVD
    
**Disadvantage**:
- Computation cost
- linear model
- k?
- don't consider order of word
- hard to incorporate new words or documents

> Farther: pLSI;

##### Topic Model

##### Word2Vec

## Tools

- WordNet