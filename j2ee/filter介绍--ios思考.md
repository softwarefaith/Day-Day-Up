#Filter介绍--iOS思考

###1.什么是Filter
过滤器是一个程序，先与相关的servlet或者JSP页面运行在服务器上。可以附加到一个或多个servlet或jsp页面上，并且检查进入这些资源的信息。Filter 并不是一个标准的Servlet ，它不能处理用户请求，也不能对客户端生成响应。;主要用于对用户请求进行预处理，对响应进行后处理，是一个典型的***处理链***。

###2.基本原理
在Servlet作为过滤器使用时，它可以对客户的请求进行处理。处理完成后，它会交给下一个过滤器处理，这样，客户的请求在过滤链里逐个处理，直到请求发送到目标为止。例如，某网站里有提交“修改的注册信息”的网页，当用户填写完修改信息并提交后，服务器在进行处理时需要做两项工作：判断客户端的会话是否有效；对提交的数据进行统一编码。这两项工作可以在由两个过滤器组成的过滤链里进行处理。当过滤器处理成功后，把提交的数据发送到最终目标；如果过滤器处理不成功，将把视图派发到指定的错误页面。

###3.开发步骤

####3.1实现Filter接口的Servlet类。
①destory（）由Web容器调用，初始化此Filter。<br/>
②init（FilterConfig filterConfig）由Web容器调用，初始化此Filter。<br/>
③doFilter（ServletRequest request,ServletResponse response,FilterChain chain）具体过滤处理代码。<br/>

#####3.2配置Filter

1.配置Filter名<br/>
2.配置Filter拦截URL模式

配置的方式有以下两种：
在Filter类中通过注解进行配置,比如：@WebFilter(filterName="log",urlPatterns={"/*"}) <br/>
在web.xml文件中通过配置文件进行配置

###4.应用
  1.使用[URL Rewriter](http://tuckey.org/urlrewrite/)实现网站伪静态
  2.检查用户访问权限
  3.修改请求参数
  3.访问日志
  
###引申于iOS
Filter抽象成 ***AOP*** 或者 是一种 ***拦截器*** ,在iOS中可以采用 ***代理方式***（比如在UIScrollView部分代理函数） 或者 ***Method Swizzling***来实现
  
