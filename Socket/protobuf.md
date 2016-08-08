#ProtoBuf

 最近看书，看到了Protobuf概念，今天学习了解下
 
###什么是Protobuf

官方给出的解释：<br/>
a language-neutral, platform-neutral, extensible way of serializing structured data for use in communications protocols, data storage, and more.

开源库位置:[这里看](https://github.com/google/protobuf)  <https://github.com/google/protobuf>
###优缺点

####优点
1，性能好，效率高

2，代码生成机制，数据解析类自动生成

3，支持向后兼容和向前兼容

4，支持多种编程语言

####缺点
1， 应用不够广

2， 二进制格式导致可读性差（二进制格式）

3， 缺乏自描述
官方文档描述如下：for instance, protocol buffers would not be a good way to model a text-based document with markup (e.g. HTML), since you cannot easily interleave structure with text

###核心概念

1，.proto文件<br/>
相当于确定数据协议，数据结构中存在哪些数据，数据类型是怎么样

2，modifiers<br/>

2-1 required 不可以增加或删除的字段，必须初始化

2-2 optional 可选字段，可删除，可以不初始化

2-3 repeated 可重复字段， 对应到java文件里，生成的是List

3，Message

在proto文件里，数据的协议时以Message的形式表现的。


##参考文档

1.<http://blog.csdn.net/caisini_vc/article/details/5599468>

2.<http://blog.csdn.net/caisini_vc/article/details/5599468>
3.开源库<https://github.com/google/protobuf>