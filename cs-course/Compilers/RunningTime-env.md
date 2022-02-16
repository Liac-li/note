# 编译器运行时环境

- Allocation of storage locations
- Access to variable and data

- 分配内存空间
    - 栈分配
    - 堆管理
    - 垃圾回收
- 访问变量和数据
> 中间代码已经产生了可运行(部分)的代码

#### 内存管理

代码中是逻辑地址，而运行时是同OS的物理地址空间进行交互

> 进程内存空间映射详见OS课程

- 静态内存分配
- 动态内存分配
    - Stack: 和函数调用相关
    - Heap：需要显式的删除来结束生命期

- Activation Tree: 跟节点为main，子节点为main调用的function
    - 函数的调用为先序遍历
    - 函数的返回为后序遍历
    每个活跃的活动都在栈中，栈底是main，中存储的是从Activation Tree 的根到当前活动p的路径 
    
- Activation Record(Frame): On the stack
    - Actual Parameters
    - Returned Values 
    - Control link: pointing to the activation record of the caller
    - Access link:
    - Saved machine status
    - Local data
    - Temporaries
    **4 Rules**:
    1. Values communicated between callee and caller are placed at the at the beginning of the callee's activation record(caller's end)    
    2. Fixed-length items in the middle
    3. Un-known length items in the callee's end
    4. top-of-stack pointer at the end of fixed-length item, (esp) 'fig 7.5'


- Heap:
    - 分配和回收
    - 空间(少的内存碎片)、效率(充分利用储存系统)、低开销(时间短)
    
#### Garbage Collection

Garbage: data that cannot referenced to  

- Overall Execution Time
- Space usage
- Pause Time
- Program Locality 

Once object become unreachable, it cannot become reachable again

- Object Allocation: add reachable object
- Parameter Passing and Return Values: as reference, remain reachable
- Reference Assignment: reachable
- Procedure Return: check the reference, pop all procedure's local variable

##### Reference Counting

- Object Allocation: `cnt <- 1`
- Parameter Passing: passing `cnt`
- Reference Assignment: `u = v` => `u_cnt -= 1`, `v_cnt += 1`
- Procedure Returns: `cnt -= n`
- Transition Loss of Reachability: `cnt_all -= 1`

##### Trace-Based Collection

TODO: add Note