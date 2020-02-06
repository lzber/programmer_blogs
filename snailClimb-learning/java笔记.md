# TODO-L1



# TODO-L2



# TODO-L3

- hashcode如何产生的？



# 集合类

1. vector和list 有什么区别？

   `Vector`类的所有方法都是同步的。可以由两个线程安全地访问一个Vector对象、但是一个线程访问Vector的话代码要在同步操作上耗费大量的时间。所以确定是单线程访问这个容器的时候，使用ArrayList

2. stack有什么独有方法？

3. stack继承了vector，又是怎么屏蔽掉vector的很多方法的呢？

4. 列举一些线程安全的集合？

# 多线程



# 面向对象设计思路

小程序规模小、 需求简单， 设计完成后， 后期维护工作少， 关注的是算法的正确性

大程序需求难以确定， 设计和测试比较复杂。 真正的需求往往在用户试用系统的过程中才会被逐步“ 开发” 出来， 使得后期维护工作十分繁重。对于大程序， 正确性遥不可及， 可维护性、 可重用性和可靠性是关注的重点， 是评价大程序设计方法优劣的重要指标。



## 什么是面向过程？

TODO



## 什么是面向对象编程？

分析哪些动作是由哪些实体发出的；
定义这些实体， 为其增加相应的属性和功能；
让实体去执行相应的功能或动作



# 静态变量

静态代码只被执行一次。 类中不同的静态块按它们在类中出现的顺序被依次执行。

问：静态变量和静态代码块哪个先执行？ TODO



# 继承

问？子类继承了父类的哪些东西? TODO 

问：覆盖和重载有什么区别？



# 容器

**下面再总结一下 list 的遍历方式选择：**

- 实现了 `RandomAccess` 接口的list，优先选择普通 for 循环 ，其次 foreach,
- 未实现 `RandomAccess`接口的list，优先选择iterator遍历（foreach遍历底层也是通过iterator实现的,），大size的数据，千万不要使用普通for循环

***问：为什么大size的数据，千万不要使用普通for循环？***TODO



## HashMap 和 Hashtable 的区别

效率： 因为线程安全的问题，HashMap 要比 HashTable 效率高一点。另外，HashTable 基本被淘汰，不要在代码中使用它；
对Null key 和Null value的支持： HashMap 中，null 可以作为键，这样的键只有一个，可以有一个或多个键所对应的值为 null。。但是在 HashTable 中 put 进的键值只要有一个 null，直接抛出 NullPointerException。



## HashSet如何检查重复

当你把对象加入`HashSet`时，HashSet会先计算对象的`hashcode`值来判断对象加入的位置，同时也会与其他加入的对象的hashcode值作比较，如果没有相符的hashcode，HashSet会假设对象没有重复出现。但是如果发现有相同hashcode值的对象，这时会调用`equals（）`方法来检查hashcode相等的对象是否真的相同。如果两者相同，HashSet就不会让加入操作成功。（摘自我的Java启蒙书《Head fist java》第二版）



## hashcode如何产生的？

TODO



# 其他

位运算，比如5右移2位？



## HashMap 的长度为什么是2的幂次方
TODO

# 数据结构

## 什么是红黑树？
TODO

## 什么是跳表





# 并发容器

1. 并发容器有哪些?
2. copyOnwriteList是什么？
3. CopyOnWrite原理是什么? 
4. 简述一下 BlockingQueue的三个实现子类？
5. concurrentHashMap的特征是什么，请描述一下？
6. ConcurrentLinkedQueue 又是什么？



#  基础知识

##  Oracle JDK 和 OpenJDK 的对比

**总结：**

1. Oracle JDK大概每6个月发一次主要版本，而OpenJDK版本大概每三个月发布一次。但这不是固定的，我觉得了解这个没啥用处。详情参见：https://blogs.oracle.com/java-platform-group/update-and-faq-on-the-java-se-release-cadence。
2. OpenJDK 是一个参考模型并且是完全开源的，而Oracle JDK是OpenJDK的一个实现，并不是完全开源的；
3. Oracle JDK 比 OpenJDK 更稳定。OpenJDK和Oracle JDK的代码几乎相同，但Oracle JDK有更多的类和一些错误修复。因此，如果您想开发企业/商业软件，我建议您选择Oracle JDK，因为它经过了彻底的测试和稳定。某些情况下，有些人提到在使用OpenJDK 可能会遇到了许多应用程序崩溃的问题，但是，只需切换到Oracle JDK就可以解决问题；
4. 在响应性和JVM性能方面，Oracle JDK与OpenJDK相比提供了更好的性能；
5. Oracle JDK不会为即将发布的版本提供长期支持，用户每次都必须通过更新到最新版本获得支持来获取最新版本；
6. Oracle JDK根据二进制代码许可协议获得许可，而OpenJDK根据GPL v2许可获得许可。



##  String 为什么是不可变的?

String 类中使用 final 关键字修饰字符数组来保存字符串，`private　final　char　value[]`，所以 String 对象是不可变的。



## 接口和抽象类的区别是什么？

口中除了static、final变量，不能有其他变量，而抽象类中则不一定。

接口的方法默认是 public，所有方法在接口中不能有实现(Java 8 开始接口方法可以有默认实现），而抽象类可以有非抽象的方法。

一个类可以实现多个接口，但只能实现一个抽象类。接口自己本身可以通过extends关键字扩展多个接口。

从设计层面来说，抽象是对类的抽象，是一种模板设计，而接口是对行为的抽象，是一种行为的规范。



## hashCode 和equal的关系？

通过我们可以看出：`hashCode()` 的作用就是**获取哈希码**，也称为散列码；它实际上是返回一个int整数。这个**哈希码的作用**是确定该对象在哈希表中的索引位置。**`hashCode() `在散列表中才有用，在其它情况下没用**。在散列表中hashCode() 的作用是获取对象的散列码，进而确定该对象在散列表中的位置。

果两个对象相等，则hashcode一定也是相同的。个对象有相同的hashcode值，它们也不一定是相等的。**因此，equals 方法被覆盖过，则 hashCode 方法也必须被覆盖**



## 关于 final 关键字的一些总结

final关键字主要用在三个地方：变量、方法、类。

1. 对于一个final变量，如果是基本数据类型的变量，则其数值一旦在初始化之后便不能更改；如果是引用类型的变量，则在对其初始化之后便不能再让其指向另一个对象。
2. 当用final修饰一个类时，表明这个类不能被继承。final类中的所有成员方法都会被隐式地指定为final方法。



# error和Exception

**Error（错误）:是程序无法处理的错误**，表示运行应用程序中较严重问题。大多数错误与代码编写者执行的操作无关，而表示代码运行时 JVM（Java 虚拟机）出现的问题。例如，Java虚拟机运行错误（Virtual MachineError），当 JVM 不再有继续执行操作所需的内存资源时，将出现 OutOfMemoryError。这些异常发生时，Java虚拟机（JVM）一般会选择线程终止。

**Exception（异常）:是程序本身可以处理的异常**。Exception 类有一个重要的子类 **RuntimeException**。RuntimeException 异常由Java虚拟机抛出。**NullPointerException**（要访问的变量没有引用任何对象时，抛出该异常）、**ArithmeticException**（算术运算异常，一个整数除以0时，抛出该异常）和 **ArrayIndexOutOfBoundsException** （下标越界异常）





## Java 中 IO 流分为几种?
TODO

## BIO,NIO,AIO 有什么区别?
Blocking I/O
NIO (New I/O), 它支持面向缓冲的，基于通道的I/O操作方法, 适合对于高负载、高并发的（网络）应用
(Asynchronous I/O)


# 开发容易犯的错误点
## 如何正确的使用 bigDecimal
BigDecimal 主要用来操作（大）浮点数，BigInteger 主要用来操作大整数（超过 long 类型）。
BigDecimal 的实现利用到了 BigInteger, 所不同的是 BigDecimal 加入了小数位的概念
使用字符串构造方法和大数对应的方法去操作，不要直接使用+、- 去操作。  



# 数组转列表与列表 与列表转数组的坑有哪些？

Collections.toArray(T[] a); //参数不能忘

Arrays.asList(T[] a) 返回的是内部类，没有实现 add/remove/clear 方法



## 什么是fast fail 机制？

TODO



# 什么是泛型？

TODO





# 线程池

## 什么是THis 逃逸？

TODO



# runnable 和 callable的区别是什么？

TODO




# **Cloneable** 接口如何使用

TODO







