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
- Stack Allocation: use relative address (offset)
    
#### 流程优化

- 基本块(Basic Block): which are maximal sequences of consecutive three-address instructions with the properties that
    - (a) The flow of control can only enter the basic block through the first instruction in the block. That is, there are no jumps into the middle of the block.
    - (b) Control will leave the block without halting or branching, except possibly at the last instruction in the block.
    
    **Algorithm**: Determine Basic Block
    1. The first three-address instruction in the intermediate code is a leader.
    2. Any instruction that is the target of a conditional or unconditional jump is a leader.
    3. Any instruction that immediately follows a conditional or unconditional jump is a leader.
    
    **Algorithm**: next use of var
    scan from the 'end of basic block to the top', for all `i: x = y + z`
    1. attach the information of `x, y, z` use and liveness to the symbol table
    2. `x` set to "not live" and "no next use"
    2. `y, z` set to "live" and the next use of `y, z` is `i` operand
- 流图(Flow Graph): basic block become node in flow graph
    set following(not end with unconditional jump) and jump as edge in graph
    
    - Loop: `e` as loop entry
        1. `e` is not ENTRY (root) 
        2. No node in $L$ besides `e` has predecessor outside $L$ (closure)
        3. Every node in $L$ has a nonempty path, completely within $L$, to `e`, (ensure loop path exists)

#### Optimization of Basic Blocks

TODO