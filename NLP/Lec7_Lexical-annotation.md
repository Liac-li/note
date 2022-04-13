# Lexical Annotation

Upstream task

> 7 Mainstream paradigms in NLP
>
>| | Input | Output |  |
>| :-: | :-: | :-: | :-: |
>| class  | text | label |
>| matching | textA; textB | label |query & match the best |
>| SeqLab | A; B; C | $L_a, L_b, L_c$ | lexical annotation| 
>| MRC(machine read recension comprehension) | Context; Question | start; end | 
>| seq2seq | <a, b, c> | <D, E, F> | 异步的; 非等长的 | 
>| seq2ASeq |   |  | seq 2 actions, complier | 
>|(M)LM (mask language model)| A, [mask], C | B | BERT |

#### Part of speech Tagging

*Why?* - structure of sentence (grammar + sematic meaning)

Input X: $\Sigma^*$, (surface word sequence)
Output Y: $\Lambda^*$ (part-of-speech sequence) POS seq

- Name entity recognition (NER)
    Ambiguity:
    1. length (chinese)
    2. property 
    3. phrase and words 
    
    - 确定实体的边界
    - 确定实体的类型

    Use **IO label**
    
    $\mathcal{Y}: ((\Lambda \times \{B, I\}) \cup \{O\})^*$
    
    任务转化为序列化标注 sentence 中的所有的的词
    
Statistic Method: $\mathcal{f}: X \to Y$

决定词的词性的因素：词语的用法 + 句子中的语法功能
统计学角度：本身的词 + 上下文的词(标注)

**HMM**

> 简化了输出上 $y_{1:n}$ 之间反复的相互联系
> 单向模型

$$
    P(W, T) = \prod_i P(t_i | t_{i-1}) P(w_i|t_i)\quad \text{(bigram)}
$$

