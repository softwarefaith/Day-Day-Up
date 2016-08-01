#GCDAsyncSocket使用

GCDAsyncSocket是CocoaAsyncSocket第三方库中的其中一个类，本文介绍的就是基于这一个类来做快速的socket通信开发，而且该库已经支持IPv4和IPv6.

对GCDAsyncSocket做了二次封装调用，一般情况下包含了建连、断开、重连、心跳、业务自定义请求等等。


###创建socket

<pre>
在GCDAsyncSocket中提供了四种初始化的方法

- (id)init;
- (id)initWithSocketQueue:(dispatch_queue_t)sq;
- (id)initWithDelegate:(id)aDelegate delegateQueue:(dispatch_queue_t)dq;
- (id)initWithDelegate:(id)aDelegate delegateQueue:(dispatch_queue_t)dq socketQueue:(dispatch_queue_t)sq;

@property (atomic, weak, readwrite) id delegate;
#if OS_OBJECT_USE_OBJC
@property (atomic, strong, readwrite) dispatch_queue_t delegateQueue;
#else
@property (atomic, assign, readwrite) dispatch_queue_t delegateQueue;
#endif

</pre>

sq是socket的线程，这个是可选的设置，如果你写null，GCDAsyncSocket内部会帮你创建一个它自己的socket线程，如果你要自己提供一个socket线程的话，千万不要提供一个并发线程，在频繁socket通信过程中，可能会阻塞掉，个人建议是不用创建

aDelegate就是socket的代理

dq是delegate的线程

必须要需要设置socket的代理以及代理的线程，否则socket的回调你无法得知。


###socket链接

####成功
<pre>
- (BOOL)connectToHost:(NSString *)host
               onPort:(uint16_t)port
          withTimeout:(NSTimeInterval)timeout
                error:(NSError **)errPtr;

</pre>
host是主机地址，port是端口号

如果建连成功之后，会收到socket成功的回调，在成功里面你可以做你需要做的一些事情,比如心跳处理。
####失败
<pre>
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port;

</pre>
在失败里面一般做了重连的操作


###socket写数据
<pre>
[self.socket writeData:requestData withTimeout:-1 tag:0];
</pre>
imeout是超时时间，这个根据实际的需要去设置
写回调
<pre>
- (void)socket:(GCDAsyncSocket*)sock didWriteDataWithTag:(long)tag；
</pre>

###socket读数据
在写之后，需要再调用读方法，这样才能收到你发出请求后从服务器那边收到的数据
<pre>
[self.socketreadDataToData:[GCDAsyncSocket CRLFData] withTimeout:10 maxLength:500 tag:0]
</pre>
[GCDAsyncSocket CRLFData]这里是设置边界符，maxLength是设置你收到的请求数据内容的最大值
<pre>
 -(void)socket:(GCDAsyncSocket*)sock didReadData:(NSData*)data withTag:(long)tag;
</pre>


###socket断开链接
<pre>
[self.socket disconnect];
</pre>


##如果作为服务端

####监听端口
<pre>

NSError * error = nil;
    [self.serverSocket acceptOnPort:[self.portTextField.text integerValue] error:&error];
</pre>

####等待链接
<pre>
- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket
</pre>
