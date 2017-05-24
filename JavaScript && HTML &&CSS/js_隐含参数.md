##JS 隐含参数


###1.arguments

arguments 该对象代表正在执行的函数和调用它的函数的参数。

***使用方式***: 
[function.]arguments[n]参数.

其中
function：选项。当前正在执行的 Function 对象的名字。 

n ：选项。要传递给 Function 对象的从0开始的参数值索引。


- Arguments是进行函数调用时，除了指定的参数外，还另外创建的一个隐藏对象。
- Arguments是一个类似数组但不是数组的对象，说它类似数组是因为其具有数组一样的访问性质及方式，可以由arguments[n]来访问对应的单个参数的值，并拥有数组长度属性length。


验证
<pre>
alert(arguments instanceof Array);
alert(arguments instanceof Object);
</pre>

- arguments对象存储的是实际传递给函数的参数，而不局限于函数声明所定义的参数列表，而且不能显式创建 arguments对象。arguments对象只有函数开始时才可用。
<pre>
var numargs = arguments.length;     // 获取被传递参数的数值。
 var expargs = functionname.length;       // 获取期望参数的数值。

</pre>



###caller

返回一个对调用function函数的函数的引用，该函数调用了当前函数。

functionName.caller

- 对于函数来说，caller属性只有在***函数执行时***才有定义。

<pre>
如果函数是由顶层调用的，那么 caller包含的就是 null 。如果在字符串上下文中使用 caller属性，那么结果和 functionName.toString 一样，也就是说，显示的是函数的反编译文本,
注意:Function.toString() 可以实现 Function 的反编译功能.如加上递归功能则功能更加强大
</pre>


###callee

对象的一个属性，该属性是一个指针返回相对应的arguments的函数引用,正被执行的 Function 对象，也就是所指定的 Function 对象的正文。多用于匿名函数递归

<pre>

function chen(x){
	if (x<=1) {
		return 1;
	}else{
		return x*arguments.callee(x-1);
	};
};
</pre>

[function.]arguments.callee可选项 function参数是当前正在执行的 Function对象的名称。

说明callee属性的初始值就是正被执行的 Function 对象。callee属性是 arguments 对象的一个成员，它表示对函数对象本身的引用，这有利于匿名函数的递归或者保证函数的封装性

- 该属性仅当相关函数正在执行时才可用。

- callee拥有length属性，这个属性有时候用于验证还是比较好的。<code>arguments.length</code>是实参长度，<code>arguments.callee.length</code>是形参长度，由此可以判断调用时形参长度是否和实参长度一致。


###apply and call 
它们的作用都是将函数绑定到另外一个对象上去运行

两者仅在定义参数方式有所区别：     
apply(thisArg,argArray);     
call(thisArg[,arg1,arg2…] ]);


主要用来 扩充函数赖以运行的作用域，对象不需要与方法有任何耦合关系。






