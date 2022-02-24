# Lec 1: Intro

#### Infor

张杰 e-mail: 
1249224822@qq.com - 苟琪 NLP
zhangyk@lamda.nju.edu.cn - 张逸凯

**目的**
1. PyTorch | TensorFlow
2. 了解智能系统的经典应用，设计和实现

**参考**
- 花书
- 西瓜书
- 《神经网络与深度学习》

10 + 50(Assignment)<30 + 20> + 40(fin)

## ML & DL

1. Define function with unknown parameters
2. Define loss function for the training data
    $e = |\bm{y} - \hat{\bm{y}}|$ Mean absolute error(MAE) 
    $e = (\bm{y} - \hat{\bm{y}})^2$ Mean square error(MSE)
    
    Scaler-by-vector gradient $\nabla L_{\theta}$
3. Optimization
    - Use mini-batch to update the parameters
    - Epoch: pass through all batches
    
Increase complexity of model:
1. more layers
2. larger layers size(more nodes)

> Use ReLU function representing **hard sigmoid**