## Chap6: 中间代码

----

## Chap7: 运行时环境

----

## Chap8: 代码生成

- instruction selection
- register allocation and assignment
- instruction ordering

> 1. level of IR
> 2. desired quality of target code
> 3. the nature of instruction-set arch

#### Instruction-Set

|指令|含义|例子|
|-|-|-|
|LD| Load dst, addr | LD R0, y; LD R0, a(10) |
|ST| store dst, src | ST R0, y|
|ADD,MUL,SUB| OP dst, src1, src2 | ADD R0, R0, 1 |
|BR| branch(jump) to label unconditional | BR 
|Bcond| jump to symbol r, L | BLTZ R0, L1 | 
|*(R0)| 取地址内容 |
|#100| immediate constant |

##### Flow-control (Target code address)

- Static Allocation
    - call *callee*
    - return
    - halt
    - action: which is a placeholder of other three-address statement
    
    size and layout are determined basing the names stored in symbol table

    three-address "call *callee*" can be translated to
    ```armasm
    ST callee.staticArea, #here+20 
    BR callee.codeArea
    ```
    and "return" to

    ```
    BR *callee.staticArea
    ```
    > 也即直接利用addr储存的跳转法
- Stack Allocation:
    TODO
    
#### 流程优化

- 基本块(Basic Block): which are maximal sequences of consecutive three-address instructions with the properties that
    - (a) The flow of control can only enter the basic block through the first instruction in the block. That is, there are no jumps into the middle of the block.
    - (b) Control will leave the block without halting or branching, except possibly at the last instruction in the block.
    
    **Algorithm**:
    1. The first three-address instruction in the intermediate code is a leader.
    2. Any instruction that is the target of a conditional or unconditional jump is a leader.
    3. Any instruction that immediately follows a conditional or unconditional
jump is a leader.
- 流图(Flow Graph): basic block become node in flow graph