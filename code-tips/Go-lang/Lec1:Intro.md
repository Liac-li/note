# Introduction to Go-lang

- `goroutine`: 可以和其他的 goroutine 并行执行的**函数**

    > `net/http` 库直接使用了goroutine
    
    是否需要一些线程安全的数据的数据结构 - `channel` 一样的，channel 对于传递指针不安全

- 利用 composition 来设计借口，类型嵌入到另一个类型中

## chap2

- `func init() {...}` can be called before `main`
- 所有同一文件夹的代码需要同一个包名
- 包内的大学字母开头的标识符是公开的，小写的是不公开的，但是可以同过接口访问
- 所以，一个最佳实践是，将方法的接收者声明为指针。对于 defaultMatcher 类型来说，使用值作为接收者是因为创建一个defaultMatcher 类型的值不需要分配内存。由于 defaultMatcher 不需要维护状态，所以不需要指针形式的接收者。
