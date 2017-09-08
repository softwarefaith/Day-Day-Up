iOS 端 DNS 相关技术

######1.Mac下 关于 DNS 插件包
在 Mac OS X 上通过 pdnsd 和 dnsmasq 加速 DNS 以及避免污染

***Note***

在默认情况下，dnsmasq在解析一个域名时，会首先查找/etc/hosts文件中的定义，如果找不到的话，再去/etc/resolv.conf中去找。

######2.程序实现 DNS 解析 ip

######2.1 通过第三方接口地址  http://119.29.29.29/d?dn=  来获取
比如解析  www.163.com&ttl=1  
返回结果:111.206.186.244;111.206.186.245,23  
其中23是ttl缓存时间 也有可能不存在

[具体代码可以看AppDNSParser类](https://github.com/softwarefaith/JiOSDNS)
######2.2  通过iOS系统提供的CFHostRef 方式来获取
//通过系统CFHostRef方式获取  添加libresolv
+ (NSString *)fetchIPFromHost:(NSString *)host;

[具体代码可以看AppDNSMapper.h类](https://github.com/softwarefaith/JiOSDNS)

######2.3  通过  gethostbyname(hostName); 

其中有一个注意点:iOS需要支持ipv6,需要调用 phost = gethostbyname2(hostName, AF_INET6);

[具体代码可以看AppDNSMapper.h类](https://github.com/softwarefaith/JiOSDNS)

######2.4  自己服务器返回 

***在替换host时,有一个注意点***

HTTP 标准中规定，服务器会将请求头中的 host 字段的值作为请求的域名。咱们使用 IP 替换 URL 中的 host 进行访问，此时网络库会将 IP 当作 host，服务器就会解析异常了.

***解决方案:  request  添加header  <host,originHost>***


######4.如何获取ip 时间,多个ip如何选择

思路: 客户端 采用***ping的方式***,在github上找了一个第三方

[具体代码可以看IpManage类](https://github.com/softwarefaith/JiOSDNS)


代码不够完善[Demo地址--https://github.com/softwarefaith/JiOSDNS](https://github.com/softwarefaith/JiOSDNS)

##参考文章

1. [https://program-think.blogspot.com/2014/01/dns.html](https://program-think.blogspot.com/2014/01/dns.html)
2. [在 Mac OS X 上通过 pdnsd 和 dnsmasq 加速 DNS 以及避免污染](http://ifreedomlife.com/2015/04/25/Speed-up-DNS-with-pdnsd-and-dnsmasq-on-MacOSX/)
3. [http://xintq.net/2017/05/16/mac-dnsmasq/](http://xintq.net/2017/05/16/mac-dnsmasq/)
4. [https://elliotsomething.github.io/2016/10/18/DNS缓存/](https://elliotsomething.github.io/2016/10/18/DNS缓存/)
5. [DNS解析失败的处理 (支持IPv6)http://nszzy.me/2016/09/07/dns-resolving/](http://nszzy.me/2016/09/07/dns-resolving/)
6. [DNS 劫持](http://www.jianshu.com/p/08f7146e045f)
7. [https://github.com/music4kid/PPDNSMapping](https://github.com/music4kid/PPDNSMapping)
