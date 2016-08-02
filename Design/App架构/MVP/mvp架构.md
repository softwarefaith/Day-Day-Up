#MVP架构

###什么是MVP

MVP是MVC的变种，其中Model和View的定义与MVC的一致，不同点在于：MVC的Controller是管理一组Model与View之间交互逻辑，是一个管理者；而Presenter（展示者）则是Model于View之间的连接者，针对特定模块的View提供对应的格式化的Model数据，将View中的行为反馈到Model中。所以MVC中的Controller一般会管理一个或多个Model和一个或多个View，而Presenter则是 M-P-V 一对一，有更细的粒度和更好的解耦。是针对有GUI存在的应用程序，目的在于，对于GUI层来说，把UI展示与逻辑分开。
![mvc-vs-mvp](mvc-vs-mvp.jpg)

<pre>
- (最主要区别）View与Model并不直接交互，而是通过与Presenter交互来与Model间接交互。而在MVC中View可以与Model直接交互
- 通常View与Presenter是一对一的，但复杂的View可能绑定多个Presenter来处理逻辑。而Controller是基于行为的，并且可以被多个View共享，Controller可以负责决定显示哪个View
- Presenter与View的交互是通过接口来进行的，更有利于添加单元测试。
</pre>

###MVP结构图

![MVP-struct](MVP-struct.png)

####MVP变种：Passive View
在这种模式下，View和Model之间不能直接交互，View通过Presenter与Model打交道。Presenter接受View的UI请求，完成简单的UI处理逻辑，并调用Model进行业务处理，并调用View将相应的结果反映出来。View直接依赖Presenter，但是Presenter间接依赖View，它直接依赖的是View实现的接口。

####组成

- (1)View:负责绘制UI元素、与用户进行交互;
- (2)View interface:需要View实现的接口，View通过View interface与Presenter进行交互，降低耦合，方便进行单元测试;
- (3)Model:负责存储、检索、操纵数据(有时也实现一个Model interface用来降低耦合)，为UI层提供的数据，或者保存UI层传下来的数据;
- (4)Presenter:作为View与Model交互的中间纽带，处理与用户交互的负责逻辑；逻辑控制层，从Model处取数据，运算和转化，最后用View来展示；并处理View传过来的用户事件，并做处理。
   因此，Presenter 层是连接 Model 层和 View 层的中间层，因此持有 View 层的接口和 Model 层的接口。
   
<code>
接口的作用类似给层与层之间制定的一种通信协议，两个不同的层级相互交流，只要遵守这些协议即可，并不需要知道具体的实现是怎样
</code>



####规则
- Model与View不能直接通信，只能通过Presenter
- Presenter类似于中间人的角色进行协调和调度
- Model和View是接口，Presenter持有的是一个Model接口和一个View接口
- Model和View都应该是被动的，一切都由Presenter来主导
- Model应该把与业务逻辑层的交互封装掉，换句话说Presenter和View不应该知道业务逻辑层
- View的逻辑应该尽可能的简单，不应该有状态。当事件发生时，调用Presenter来处理，并且不传参数，Presenter处理时再调用View的方法来获取。




###MVP优点
- 模型与视图完全分离，我们可以修改视图而不影响模型；同时，高效的使用模型，所有的交互发生在    Presenter内部
- View和Model抽象成为接口
- 代码更加容易移植
- 代码更加容易加入Unit Testing

###MVP深入思考
对于 Presenter 的设计，或者说具体应该把哪些内容放到 Presenter 中，是一个关键。Model 并不是必须有的；如果带有 Model，则 Presenter 要实现 Model 的回调，在回调中把数据传给 View 或响应。所以 Presenter 必须得有 View 的引用，但可以不用 Model.





##参考文章

1.Andriod MVP架构<br/>
<http://toughcoder.net/blog/2015/11/29/understanding-android-mvp-pattern/>

2.Google Andriod架构蓝图

<https://github.com/googlesamples/android-architecture>