##ES6编程艺术

###简介

简单来说，ECMAScript是JavaScript的语言国际标准，js是ECMAScript的实现。


###1.let and const

####1.1 let命令
类似于var ，用来声明变量，但是只在let所在的代码块中有效

<pre>
	{
       let b = 200;
       var a = 100;
    }
    console.log(a);
    console.log(b); //Uncaught ReferenceError: b is not defined
</pre>

- let 不存在变量提升，在js当中不存在块级作用域，a可以再外部访问。
- 只要块级作用域内存在let,它所声明的变量就绑定在这个领域，不在受外部影响。
<pre>
		 var a = 200;
    {
        console.log(a); //undefined
        let a = 100;
        console.log(a); //100
    }

</pre>
这一点与一般性的语言不同


- 在相同的作用域，不允许声明同一个变量

<pre>
 {
        var a = 100;
        var a = 200;
        console.log(a);  //200
  }

    {
        let b = 100;
        var b = 200;
        console.log(b);  //error ,重复定义

    }

</pre>

####1.2 块级作用域 
ES5只有全局作用域和函数作用域，没有块级作用域，带来了很多不合理的场景
- 内层变量可能会覆盖外层变量
- 用来计数的循环变量泄露为全局变量

let实际上为JS新增了块级作用域

哈哈，终于不需要写立即函数了----

####1.3 const命令
声明常量,只在当前代码块有效

不可重复声明，暂时性死区

const 对象 
对象冻结 

####1.4跨模块常量
<pre>
//1.module.js
export const name= "value";

//2.use.js
import * as variant from './module'
console.log(variant.name);

</pre>
####1.5全局对象属性