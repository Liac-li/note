# 统计方法

Target: get a projection $\mathcal{X} \to \mathcal{Y}$ and $P(y = i | \bm{x})$

> prior distribution
> *a priori*: knowable without appeal to particular experience

- Parametric: How to estimate distribution: just estimate all the parameters of given distribution (Gaussian distribution) <PDF => parameter estimation>
- Non-parametric: estimate probability density of points in data space with data ($P(\bm{x} | D)$) 
    But allow to estimate infinite parameters, while finite in parametric estimate
    > know or not distribution function
    
## Models

1. Generative (probabilistic) models: $P(\bm{x} | y=i),\, P(\bm{y})$ (joint distribution)
2. Discriminative models: $p(y=i|x)$

all have 2 steps: inference(train) + decision(prediction)

#### Parametric Estimation

For Gaussian: $\bm{\theta} = (\mu, \sigma^2)$

Likelihood of gaussian distribution

$$
    P(D |\bm{\theta}) = \prod_{i} P(x_i | \bm{\theta}) = \prod_i \frac{1}{\sqrt{2\pi} \sigma} \exp\left(-\frac{(x - \mu)^2}{2\sigma^2}\right)
$$

But **choose which one** when likelihood $P(D|\bm{\theta_1}) > P(D | \bm{\theta_2})$
**Maximize likelihood**

$$
    \bm{\theta}^* = \argmax_{\theta} l(\bm\theta)
$$

**Bayesian**: all variable is a distribution

$P(\bm\theta|D)$ is a distribution

set $P(\bm\theta) \sim N(\mu_0, \sigma_0^2)$

Likelihood:

$$
    P(\mu|D) = \frac{P(D\mu)P(\mu)}{\int P(D|\mu)P(\mu)d\mu} = \alpha P(D|\mu)P(\mu) = \alpha \prod_{i}P(x_i|\mu)P(\mu)
$$

#### Non-parametric Estimation





