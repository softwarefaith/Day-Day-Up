#iOS多任务并发执行解决方案

##Operation object：

该技术出现在OS X 10.5中，通过将要执行的任务封装成***操作对象***的方式实现任务在多线程中执行。任务可以理解为你要想执行的一段代码。在这个操作对象中不光包含要执行的任务，还包含线程管理的内容，使用时通常与操作队列对象联合使用，操作队列对象会管理操作对象如何使用线程，所以我们只需要关心要执行的任务本身即可。**更高层次的抽象**

#####NSOperation
NSOperation是抽象基类，需要实现相应子类。不Cocoa提供了两个具体的子类NSInvocationOperation和NSBlockOperation。其中NSInvocationOperation以@selector来创建operation object；NSBlockOperation以block来创建operation object.当然你也可以自己自定义

所有的operation objects都支持这些***特性***：

- 依赖关系，可以阻塞某个operation，直到他所依赖的所有operation都已经完成
- 可以设置completion block
- 可以通过KVO来监控operation的状态
- 可以设置operation的优先级
- 可以取消

创建operation object之后，加入到适当的operation queue即会立刻开始执行。

**Note**

关于这部分有兴趣的可以看看AFNetworking2.0源码

#####Operaton queue
- 可以设置并发执行的operation 数量，设为1，即为串行队列
- 可以暂时挂起，继续，等待直到完成
- 
##GCD：

该技术出现在OS X 10.6中，它与Operation Object的初衷类似，就是让开发者只关注要***执行的任务本身***，而不需要去关注线程的管理。你只需要创建好任务，然后将任务添加到一个工作队列里即可，该工作队列会根据当前CPU性能及内核的负载情况，将任务安排到合适的线程中去执行。

关于GCD,可以看我之前的文章[GCD概论](http://www.jianshu.com/p/8767ce26c586)

###Idle-time notification：
该技术主要用于处理优先级相对比较低、执行时间比较短的任务，让应用程序在空闲的时候执行这类任务。Cocoa框架提供NSNotificationQueue对象处理空闲时间通知，通过使用NSPostWhenIdle选项，向队列发送空闲时间通知的请求。

***在iOS中，消息机制基于广播模型***

消息中心(NSNotificationCenter) 是基于进程的单件实例；消息队列（NSNotificationQueue）是基于线程的，每个线程都有有一个默认的消息队列，这个队列关联与消息中心，每个消息中心或线程可以关联多个队列。

***消息中心是采用同步方式，消息队列采用异步方式***

###Asynchronous functions：
系统中有一些支持异步的函数，可以自动让你的代码并行执行。这些异步函数可能通过应用程序的守护进程或者自定义的线程执行你的代码，与主进程或主线程分离，达到并行执行任务的功能。

###Timers：
我们也可以在应用程序主线程中使用定时器去执行一些比较轻量级的、有一定周期性的任务。

***常用的NSTimer***


##文章参考
1.<http://www.jianshu.com/p/8767ce26c586>