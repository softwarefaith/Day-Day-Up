
##GCD


dispatch_queue_set_specific就是向指定队列里面设置一个标识 如：

dispatch_queue_set_specific(queue1, queueKey1, &queueKey1,NULL);
就是向queue1对了中设置一个queueKey1标识。

dispatch_get_specific就是在当前队列中取出标识，注意iOS中线程和队列的关系，所有的动作都是在队列中执行的！

应用：判断是否是当前执行的队列


