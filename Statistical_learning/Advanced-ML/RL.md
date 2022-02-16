# RL

- Actions: $A$
- State space: $X$
- Reward: $R: X\times A\times A \to R$
- Transition: $P: X\times A\times X \to P$
- 策略： $a = \pi(x)$
    $P(a|x) = \pi(x, a) \Rightarrow \sum_{a\in A}\pi(x, a) =1$, $\forall a\in A, \pi(x, a) > 0$
- 策略评价：
    - T-step: $\frac{1}{T} \sum_{t}^T r_t$
    - discounted: $\sum_{t=1}^{\infty} \gamma^t r_t$

最大化回报