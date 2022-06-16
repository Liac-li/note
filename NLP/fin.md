#### Problems

1. 如何做形式化
2. 什么问题，怎么建模
3. 如何训练和推理
4. 优点和缺点


## NLP 中出现过的假设

- 有且只在当前文档中出现次数多的词语有一些代表性
- 词周围的句子可以表示词的含义 (win-bow); You can get a lot of value by representing a word by means of its neighbors 
- N-gram 假设
- 样本空间越大，最大似然估计值越接近于真实分布
- 统计学角度来看，词的词性和上下文的词性有关，和上下文也有关

## Lec 2: 文本分类

#### 形式化表达

##### Symbolic Encoding

- Bag of words
    * 离散表示词是否出现
    * 连续的对于词的某个特征进行表示(出现次数，频率)

- Tf-idf:
    * Term frequency: $f_{ij}$ frequency of term i in document j. Add Normalize $tf_{ij} = \frac{f_{ij}}{\max_i f_{ij}}$
    * $df_i$ document frequency of term i, or number of documents containing term i. Inverse it $\log_2 (N / df_i)$
    
    tf-idf weight = $tf_{ij} idf_{i}$
    
    a term occurring frequently in the document but rarely in the rest of the collection if given hight weight
    
- one-hot & distributed encoding
    * co-occurrence matrix
    
#### Model

- Naive Bayes: a prior to many observations
    $$
       P(C_k | x_1, \dots, x_n) \propto p(C_k)\prod_{i=1}^{n} P(x_i | C_k)
    $$
    
    **Train**: counting
    
    $$
        P(D_i | C_k) = \frac{\left(\sum_t D_{it}\right)!}{\prod_{t=1}^{|V|} D_{it}!} \prod_t P(w_t|c_k)^{D_{it}}
    $$

    > 注意到 $D_i \in \mathbb{R}^{|V|}$, 也即是说朴素贝叶斯模型的意思就是把 $D_i$ 中的各个位置分别当作一个观察

    **If training model by counting will lead to zero probability problem** => do smoothing
    
- Linear Model
  
    Define a score function $\psi(x, y) = \bm{\theta}^T\bm{f}(x, y)$
    
    Training: find a proper weight $\theta$ given function and labeled dataset (**gradient method**)

## Lec4: Language Model

**A language model is a probability distribution over sequences of words**

使用贝叶斯方法的时候总是会引入一个先验分布 $P(w)$

#### Model

- N-gram: add Markov assumption to sentence
    $$
    P(W) = P(w_1, w_2\dots w_n) = p(w_1)p(w_2|w_1)P(w_3|w_2)\cdots \quad \text{1-gram}
    $$
    
    **Training**: maximum likelihood & co-relational frequency
    
    **数据稀疏问题**: (构造等价类，平滑) (n-gram 共现带来的)
    * Smoothing: 对于未观察的变量赋予一个概率值(nothing is impossible)
        1. Add counts: not good
            $$
                P_{add-\delta}(x) = \frac{c(x) + \delta}{\sum_{x'} (c(x') + \delta)}
            $$
        2. Laplace smoothing:
            $$
                P_{dir}(w|w_{-1}) = \frac{c(w_{-1}, w) + k\hat{P}(w)}{k + \sum_{w'}c(w_{-1}, w')} 
            $$

            General Form 

            $$
                P(w|c) = \frac{count(w, c) + \alpha}{\sum_{w'}count(w', c) + \alpha * dim}
            $$

            > Additive smoothing is a type of shrinkage estimator, as the resulting estimate will be between the empirical probability (relative frequency) ${x_{i}/N}$, and the uniform probability $1/d$
            
            > 优点是可以通过各种形式引入先验知识，本质上是一种拓展
            
        3. 简单线性平滑:
            $$
                P(w_i| w_{i-1}, w_{i-2}) = \bm{\lambda}^T \begin{bmatrix}P(w_i | w_{i-1}w_{i-2})\\ P(w_i | w_{i-1})\\ P(w_i)\end{bmatrix}
            $$
            
            where $\lVert \lambda \rVert_1 = 1$
            
            > combine bi-gram, 1-gram and zero gram
    
- 线性语言模型:
    $$
        P_{\bm{w}}(Y = y | X = x) = \frac{\exp \bm{w}\cdot \phi(x, y)}{\sum_{y' \in \mathcal{Y}} \exp \bm{w} \cdot \phi(x, y')}
    $$
    
    转向了特征工程的打分函数 $\phi()$ 的设计
    
    使用 n-gram 作为打分函数的话也就是 $\phi = P_{\bm{w}}(x_i, \bm{h}_i)$ $\bm{h}_i$ 为长度为 n 的历史信息 $x_{i-n+1:i}$
    
- 基于神经网络:

    特征提取 + 模型训练
    
#### 领域知识

- Zipf Law: 以词频排序的时候，词频和排位的乘积为一个常数

    $$
        freq * rank = k
    $$
    
- 模型评价: 在测试集上

    $$
        \begin{aligned}
            PP(W) &= 2^{H(w)} \\
                &= 2^{-1/N \log_2 P(w_{1:N})}\\
                &= (2^{\log_2 P(w_{1:n})})^{-1/n}\\
                &= \sqrt[N]{\frac{1}{P(w_1, w_2, \dots w_n)}}
        \end{aligned}
    $$
    
    ??? 越小越好 (最小化熵)
    
## Lec7: Sequence Labeling

给每个词表上词性 (Part-of-Speech), 反映了词的语法属性

**Problems**:
1. 词性的歧义问题

关注的问题 NER (Named Entities Recognition)

形式化表达: IBO Labels

#### Model

- HMM

    $$
        P(S, O) = \prod_i P(s_i|s_{i-1})P(o_i|s_i)
    $$
    
    **Training**
    $$
        \begin{aligned}
            P(s_i | s_{i-1}) &= \frac{C{s_i, s_{i-1}}}{C(s_{i-1})}\\
            P(o_i | s_i) &= \frac{C(s_i, o_i)}{c(s_i)}
        \end{aligned}
    $$
    
    **Inference**
    Target: $t^* = \argmax_t P(t|w)$
    
    $$
        \begin{aligned}
            P(t|w) &= P(t, w)/ P(w)\\
                &\approx P(t, w)\\
            P(t_{1:n}, w_{1:n}) &= P(t_n, t_{1:n-1}, w_n, w_{1:n-1}) \\
                &= P(t_{1:n-1}, w_{1:n-1})P(t_n|t_{n-1})P(w_n|t_n) \quad \text{Markov Assumption}
       \end{aligned}
    $$
    
    Thus, if we let $v_t(j)$ assign to the maximum probability of $P(t_{1:t}, w_{1:t})$
    
    $$
        v_t(j) = \max_{i=1}^N v_{t-1}(i)\cdot a_{ij} \cdot b_j(o_t)
    $$

    **Problems** 
    1. HMM 为一个单向的模型吗，且没有长距离依赖
    2. 没有训练数据就嘎了， 使用 [Baum Welch Alg](https://en.wikipedia.org/wiki/Baum%E2%80%93Welch_algorithm)
    3. 中文分词可以吗？？？
    
- CRF (Conditional Random Fields)

    $$
        P(Y | X) = \frac{1}{Z(X)}\exp \sum_{k=1}^K w_k F_k(X, Y)
    $$
    
    可以引入特成函数 $F_k(X, Y) = \sum_{i=1} f_k(y_{i-1}, y_i, X, i)$

    > 此处注意， 引入了 $y_i$ 只与 $y_{i-1}, X, i$ 有关的假设，可以认为是一种退化(简化)
    
    **Training**: human designed feature function
    
    **Inference**: Viterbi
    
    Target: $y^* = \argmax_y P(y|x)$
    
    $$
       P(y|x) \approx P(x, y)
    $$
    
    在我使用了线性模型的假设的时候，可以直接认为模仿 HMM 的一阶马尔科夫的假设

    $$
        v_t(j) = \max_{i=1}^N v_{t-1}(i) \sum_{k=1}^K w_k f_k(y_{t-1}, y_t, X, t)
    $$
    
    **Problem**

    使用梯度方法优化特征函数的参数的时候:

    $$
        \mathcal{L}(\theta) = \sum_{x^s \in \mathcal{X}}\left[\sum_{i=1}^n F_k(X, Y) - \log(Z(x^s))\right]
    $$
    
    正则化项$Z(x^s)$的计算 ???
    
- 神经网络:
    ...

    **Multi-Task**
    
    From different domain and share some representation in deeper layers;
    
    数据不足的情况下同时训练多个任务的模型，多个任务互有联系和区别


## Lec8: Lexical Analysis

- [ ] 去看看形式语言自动机 TODO

概率文法 ？？？

- 数据的来源: 文法生成式的来源？？？

    TreeBank(Penn WSJ TreeBank)
    
    **Problem**

    Ambiguity in TreeBank
    
- 文法生成式的简化: CNF 范式，二叉树

- 文法推导
    * Top-down
    * Down-Top:
        Shift-Reduce, CKY 加速算法(基于 CNF 范式)

#### 概率上下文无关

一般的文法生成式中加入了 $P(R)$ 为每条生成式赋予的概率

- 如何计算整体的概率 $\prod p(\alpha \to \beta)$
    > 但是本质上对于句法的生成也是一个固定的，只有最底层的从终结符号的到非终结符号的部分

**Training**

- 最大似然估计
- 有监督学习：从书库中计数
- 无监督学习：使用 EM

    $$
        P(x_{1:n}|s, \theta)
    $$


## 词向量问题

> n-gram 带来的稀疏性问题，降低到更小的 n-1 gram 上

#### Word2Vec

使用周围词去预测中心词

$$
    \max P(w_c | w_o, \theta)
$$

1. 周围词取平均
    $$
        v_o = \frac{1}{2k} \sum_{j \in [i-k, i+k], j\neq i} w_j
    $$
2. 使用 Softmax 和内积作为相关性
    $$
        P(w_i | w_o; \theta) = \frac{\exp v_o^T v_i}{\sum_{j=1}^{|V|} \exp v_o^T v_j}
    $$
3. 优化:

    $$
        \begin{aligned}
        J(\theta) &= -\log P(w_i| w_o; \theta)\\
           &= -u_o^T v_i +  \log \sum \cdots
       w\end{aligned}
    $$
4. 加速: Softmax 的空间过大，修正为一个副采样的内容

#### GloVe

$$
    J = \sum_{i, j = 1}^{|V|} f(X_{ij})\cdot (v_i^Tv_j + b_i + b_j - \log X_{ij})^2
$$

## 基于神经网络的语言模型

## RNN

- RNN:
    $$
        \begin{aligned}
            O &= Softmax(W_o H + b_o)\\
            H &= f(W_h H_{prev} + W_i \bm{e} + b)\\
            e &= embedding
        \end{aligned}
    $$
    
    Loss function: CE
    
- LSTM:

    forget, input, output gates

    $$
    \begin{aligned}
            f_t &= \sigma(W_f h_{t-1} + U_f x_t + b_f)\\
            i_t &= \sigma(W_i h_{t-1} + U_i x_t + b_i)\\
            o_t &= \sigma(W_o h_{t-1} + U_o x_t + b_o)\\
            \hat{C} &= tanh(W_c h_{t-1} + U_c x_t + b_c)\\
            C_t &= f_t * C_{t-1} + i_t * \hat{C_t}\\
            h_t &= o_t * tanh(C_t)
        \end{aligned}
    $$
    
- GRU

    Update, reset gates
    
    $$
    \begin{aligned}
            z_t &= \sigma(W_u h_{t-1} + U_u x_t + b_u)\\
            r_t &= \sigma(W_r h_{t-1} + U_r x_t + b_r)\\
            \hat{h} &= tanh(W_h(r_t * h_{t-1}) + U_h x_t + b_h)\\
            h_t &= (1 - z_t) * h_{t-1} + z_t * \hat{h}_t
        \end{aligned}
    $$

**Problems**

- Gradient Vanishing: ReLU, residual connection
- Gradient explosion: Gradient Clip

## 机器翻译 + 预训练模型

Translate sentence from source language to target language. Often implemented with end-to-end framework(seq2seq)

Encoder -> Decoder

**Problem**

- Valine RNN seq2seq model, the tail hidden state will become a bottleneck of the stream of massage.
- Perform badly on model explaining while translating
- Cannot handle the non-linear relation in sequence
- $h_t$ depend on previous hidden states
- difficulty in parallelism

> Attention
>> a. Bottleneck; b. long distance dependence; c. better interpretability
>
>> $e_i = s^T h_i$; $e_i = s^T W h_i$; $e_i = s^TW_1 + h_i^T W_2$

In Translation: Q => decoder layer, K => all encoder layers, V => all encoder layers

> How to use with $h_t$ ???

#### Pre-trained Model

- 词向量固定的情况下对于上下文的利用不足，同时也有一词多意的问题，也是需要解决的

使用预训练模型更好的建模词向量 (pre-training + fine-tune)

- ELMO
- BERT: Masked Language Model; Next Sentence Prediction

#### Rule-based

通过某种深层次的表达在源语言和目标语言之间相互转换和生成

1. 词汇转换： Easy
2. 句法转换: Base on phrasing tree
3. 语义转换: ???

**Problem**

1. 严重的人工依赖
2. 大规模系统维护艰难
3. 规则之间产生冲突

#### Analogy-Based

在语料库中匹配相似的句子，然后逐个逐个词语替换

**Problem**
1. 如何度量句子相似度: 某些距离(编辑距离)
2. 对于为出现数据(实例相似度低)时翻译欠佳
3. 搜索基于句子，不能做长文本的翻译

#### Statistic MT

$$\argmax_y P(y|x)$$

**Noisy Channel**: 原始信号经过噪声扰动到了目标观测信号

$$
    \begin{aligned}
        \argmax_y P(y|x) &= \argmax_y \frac{P(y)P(x|y)}{P(x)}\\
            &= \argmax_y P(x|y)P(y)
    \end{aligned}
$$

1. $P(y) = P(y_1)P(y_2|y_1)P(y_3|y_2, y_1)\dots$
2. $P(x|y) = \sum_a P(x, a|y)$, 其中 $a = [a_1, \dots, a_n]$ 为一种对其方式

    $$
    	\begin{aligned}	
		P(x, a|y) &= P(n|y)P(a|y, n)P(x|y, a, n)\\
		&= P(n|y)\prod_{j=1}^{n}(P(a_j|a_1\dots, a_{j-1}, x_1, \dots, x_{j-1}, y, n)\times
			P(x_j|a_1, \dots, a_{j-1}, x_1, \dots, x_{j-1}, y, n))
	\end{aligned}
    $$
    
    assumptions:

    a. $P(n|y) = c$

    b. $a_j \sim \text{uniform}(0, 1, \dots, m)$ => $P(a_j | a_1, \dots, a_{j-1}, x_1, \dots, x_{j-1}, y, n) = \frac{1}{m+1}$

    c. $x_j \sim \text{Categorial}(\theta_{y_{a_j}})$ => $P(x_j|\dots, y,n) = P(x_j|y_{a_j})$

TODO: Decode $y$ with viterbi


#### Benchmark

- BLUE:

    **Basic**

    $$
        p_n = \frac{\sum_{y^*}\sum_{ngram\in y^*} count_{match}(ngram)}{\sum_{y^*} \sum_{ngram\in y^*}count(ngram)} \quad \text{为翻译得到的句子$y^*$ 在 ngram 下的评分}
    $$
    
    $$
        \prod_{n=1}^4 p_n^{w_n} \quad w_n = \frac{1}{4}
    $$
    
    **引入长度过短惩罚**
    
    c 为译文长度，r 为参照译文中最短或者最相近的长度

    $$
        BP = \left\{\begin{aligned}
            &1, &c > r\\
            &e^{1-\frac{r}{c}}, & c \leq r
       \end{aligned}\right.
    $$
    
    $$
       BLUE = BP \times \prod_{n=1}^4 p_n^{w_n} = BP \times \exp(\sum_{n=1}^4 w_n \log p_n)
    $$

    > BLUE 虽然简单，但是在实践中证明同人类的感知即为相近在机器翻译任务的评价中 
    
