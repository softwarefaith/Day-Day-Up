#简谈React Native
   
#睁眼看趋势
       混合式开发，跨平台开发一直备受青睐，目前我了解的有：***Web加载HTML5,PhoneGap,CrossApp,自定义XML，不得不提最近很火的Reac Native***<br/>.
       为什么会如此受欢迎？大部分存在以下四点：<br/>
         	1.团队成员的成本问题<br/>
        	2.开发周期中测试效率<br/>
         	3.多端代码难以复用<br/>
         	4.App更新周期比较长，尤其苹果<br/>
         	
#我眼中的RN
  
        + 大部分使用JS进行构建原生APP
        + Learn once ,write anywhere;write once,runeverywhere
        + 实现热更新
        + 支持脚本与原生模块相互交互，内部桥连接
        + 多端代码可以复用
        
#RN运行环境
       
       1.JS环境
       2.iOS平台：内置JavaScriptCore
       3.安卓平台： 采用了Webkit.org 官方开源库
#RN原理
	React Native会把应用的JS代码编译成一个js文件, React Native进行解释运行该脚本文件:    1.如果是js 扩展的API,则直接通过bridge调用native方法;     2.如果是UI界面,则映射到virtual DOM这个虚拟的JS数据结构中，通过bridge 传递到native ，然后根据数据属性设置各个对应的真实native的View。    3.bridge是一种JS 和 平台代码通信的机制,用bridge函数传入对方module 和method即可得到异步回调的结果。
      运行流程就是：JS ->虚拟DOM ->Bridge -> UI
      
#RN带来的优势以及隐藏的缺点 
     首先，用React组件化开发，提高了开发效率，代码复用率较高；其次从架构层角度来讲，组件间低耦合，便于扩展；另外采用了ES标准特性以及使用Chrome调试。
     再来分析下它带来的缺陷：学习成本相对较大，应用开发存在一定局限性，开发高级的App应用，纯RN达不到要求；
     
#写在最后
    可能有人会考虑，到底该不该学习RN呢？ 请自行决定。程序员更要注重自己的内功，当然从横向角度来看，学习也无妨，毕竟考虑自己腰包。程序猿不易，且行且珍惜。    
    
       
    
         	
 