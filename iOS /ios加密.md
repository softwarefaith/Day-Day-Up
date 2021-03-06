#iOS加密

##背景
在开发应用的时候，数据的安全性至关重要，而仅仅用POST请求提交用户的隐私数据，还是不能完全解决安全问题。

##加密算法分类
1.对称性加密算法

- 对称性加密算法，信息接收双方都需事先知道密匙和加解密算法且其密匙是相同的，之后便是对数据进行 加解密了。

2.非对称性加密算法

- 非对称算法与之不同，发送双方A,B事先均生成一堆密匙，然后A将自己的公有密匙发送给B，B将自己的公有密匙发送给A，
- 如果A要给B发送消息，则先需要用B的公有密匙进行消息加密，然后发送给B端，此时B端再用自己的私有密匙进行消息解密，B向A发送消息时为同样的道理。总而言之：公钥与私钥的作用是：用公钥加密的内容只能用私钥解密，用私钥加密的内容只能 用公钥解密。


##常见加密方案剖析

###Base64
Base64编码可用于***在HTTP环境下传递较长的标识信息***。<br/>

***安全原则***: 凡是涉及到私密信息的发送,都不能够发送明文,需要加密之后再发送.<br/>

#####原理
***base64*** : 将原来 8个 bit 为一个字节的数据 6个 bit 为一个单位处理. 导致 数据量会增大,增大 (8-6)/6 = 1/3.不足的部分用 0 补齐.每两个0 就用一个 = 表示.


#####特点
- 采用Base64编码不仅比较简短，同时也具有不可读性，即所编码的数据不会被人用肉眼所直接看到。
- base64 可以对任意的文件进行加密.
- base64 过程是***可逆的***. 可以反向解密.

###MD5
md5 (信息-摘要算法) .散列运算. ------> 生成固定的字符串.<br/>
一般用作——文件检验!

#####特点
- 算法是公开的，过程是不可逆的.
- 任何不同的两个文件,生成的结果是不同的,字符串的长度是相同的.

#####加固方案

MD5解密网站：<http://www.cmd5.com>

- 使用加盐（通过MD5解密之后，很容易发现规律）

- 多次MD5加密（使用MD5解密之后，发现还是密文，那就接着MD5解密）

- 先加密，后乱序（破解难度增加）

###RSA基本原理

RSA使用"秘匙对"对数据进行加密解密.在加密解密数据前,需要先生成公钥(public key)和私钥(private key).

* 公钥(public key): 用于加密数据. 用于公开, 一般存放在数据提供方, 例如iOS客户端.
* 私钥(private key): 用于解密数据. 必须保密, 私钥泄露会造成安全问题.

###动态密码
动态密码: 相同的密码明文,每次发送到服务器,密码都不同.可以理解为先将普通密码加密再加上一段会变化的数据（比如时间）再进行一次加密。

### Token

看我之前的文章<http://www.jianshu.com/p/c05edd4bb55c>

###概念：数字签名和数字证书
######数字签名：
将报文按双方约定的HASH算法计算得到一个固定位数的报文摘要。在数学上保证：只要改动报文中任何一位，重新计算出的报文摘要值就会与原先的值不相符。这样就保证了报文的不可更改性。
将该报文摘要值用发送者的私人密钥加密，然后连同原报文一起发送给接收者，而产生的报文即称数字签名。

######数字证书
数字证就是互联网通讯中标志通讯各方身份信息的一系列数据，提供了一种在Internet上验证您身份的方式，其作用类似于司机的驾驶执照或日常生活中的身份证。它是由一个由权威机构-----CA机构，又称为证书授权（Certificate Authority）中心发行的，人们可以在网上用它来识别对方的身份。数字证书是一个经证书授权中心数字签名的包含公开密钥拥有者信息以及公开密钥的文件。最简单的证书包含一个公开密钥、名称以及证书授权中心的数字签名。







