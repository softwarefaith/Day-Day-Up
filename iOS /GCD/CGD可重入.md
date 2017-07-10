#dispatch_queue_set_specific

##可重入的概念

首先，简单介绍下可重入的概念，比如一个函数，如果能够并行进入该函数且不出现问题，则可为可重入，而GCD是一个对共享资源的访问进行串行化的队列，所以是不可重入的，需要寻找一些技巧去绕开这个限制；

##GCD可重入方法

在GCD中主要利用dispatch_queue_set_specific，向指定队列里面设置一个标识 如：

	   dispatch_queue_set_specific(queue1, queueKey1, &queueKey1,NULL);
就是向queue1对了中设置一个queueKey1标识。


使用模板

    static voidvoid *queueKey1 = "queueKey1";  
          
    dispatch_queue_t queue1 = dispatch_queue_create(queueKey1, DISPATCH_QUEUE_SERIAL);  
        dispatch_queue_set_specific(queue1, queueKey1, &queueKey1, NULL);           
	if (dispatch_get_specific(queueKey1)) {
	    //说明当前的队列就是queue1
	}else{
	    </span>//说明当前的队列不是是queue1
	}