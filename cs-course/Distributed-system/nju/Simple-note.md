# 并行处理技术

课程网站 [nju](https://cs.nju.edu.cn/lxie/parallel.htm)

## Chap2 并行结构

- SMP: 多cpu使用共享内存
- MPP: 多独立PC, 利用网络链接(通用的可拓展的商用服务器)

#### Clusters

- **HPC(High performer clusters)**

  任务分配到计算结点,使用通用的PC

  适合多个计算结点内有大量的通讯需求

- **Balanced Cluster**
- 网格: 独立的PC处理一些内容,没有任务分配(P2P)

## Chap3 性能评价


- 工作负载
  1. $T = T_{\text{compute}} + T_{\text{parallelism}} + T_{\text{commutation}}$

    depend on CPU, not the work

  2. 运算数目, 指令数目
- 并行和通讯开销: 
  - 通讯: Hot potato $t = t_{12} + t_{23} + t_{34} + \dots$
