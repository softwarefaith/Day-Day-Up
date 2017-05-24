##Sass学习

###介绍
Sass 有两种语法规则(syntaxes),目前新的语法规则（从 Sass 3开始）被称为 “SCSS”( 时髦的css（Sassy CSS）),它是css3语法的的拓展级，就是说每一个语法正确的CSS3文件也是合法的SCSS文件，SCSS文件使用.scss作为拓展名。第二种语法别成为缩进语法（或者 Sass），它受到了Haml的简洁精炼的启发，它是为了人们可以用和css相近的但是更精简的方式来书写css而诞生的。它没有括号，分号，它使用 行缩进 的方式来指定css 块，虽然sass不是最原始的语法，但是缩进语法将继续被支持，在缩进语法的文件以 .sass 为拓展名。

###安装

####1.安装rvm

<code>

1.安装rvm$ curl -L get.rvm.io | bash -s stable
2.装载rvm$ source ~/.rvm/scripts/rvm
3.安装2.3.0版本ruby$ rvm install 2.3.0
4.将2.3.0设为默认$ rvm use 2.3.0 --default

rvm -v  验证是否安装成功

</code>

####2.利用rvm安装ruby

<code>
sudo rvm install ruby
</code>

####3.安装sass
<pre>
sudo gem install sass

sass -v  测试是否安装成功
</pre>

####4.webStorm配置

在设置页面中，选择Preferences -> Tools -> File Watcher 配置

##基础

####0.注释
有三种形式：

（1）//comment：该注释只是在.scss源文件中有，编译后的css文件中没有。

（2）/! /：重要注释，任何style的css文件中都会有，一般放置css文件版权说明等信息。

（3）/ /：该注释在compressed的style的css中没有，其他style的css文件都会含有。
####1.变量
 变量的定义一般以$开头:***$name***，某个变量的作用域仅限于他们定义的层级以及子层级。 

##### 1.1局部变量
 
  sass中局部变量定义与其他语言定义一样，比如：
 <pre>
 body {
 $color:red;
 color:$color;
 }
 </pre>
 
 编译以后:
 <pre>
 body {
  color: red;
   }
 </pre>
 
##### 1.2全局变量
 如果希望某个在子选择器中定义的变量能够成为全局变量，可以使用***!global***关键字
 <pre>
  body {
 $color:red !global;
 color:$color;
 }
 </pre>
 
##### 1.3变量默认值
  如果想给定义的变量初始化默认值，可以使用***!default***关键字
<pre>
$color:red !default;
</pre>

#####1.4 多值变量

多值变量分为两种形式: 数组和字典

数组:

<pre>
$paddings:5px 10px 5px 10px;
通过nth取其中的某一个值：nth($paddings,1):取padding的第一个值
</pre>

字典：
<pre>
$maps:(color:red, borderColor:blue);
可以通过map_get($maps,boderColor)获取其中某一个key值
</pre>

#####1.5变量特殊用法

嵌套引用在其他编程语言中即是字符串插值，需要用#{}进行包裹
<pre>
$left:left;
.div1{
    border-#{$left}-width:5px;
}
</pre>


在变量定义中，下划线与横线相同，比如：
$text_info ===  $text-info



####2.文件导入

在sass中，定义文件以下划线 “_” 开头 代表部分文件，不会编译出css，这为了表面生成多余css
比如：定义 _part.scss 
其中导入使用 @import 'part'

***如何区分原生css导入***

被导入文件名字以.css结尾

被导入文件是以URL地址

被导入的文件是css的url()值


####3.嵌套

#####3.1选择器嵌套

<pre>
body{
    header {
        color: red;
    }
}
</pre>
编译后结果：
<pre>
body header {
color: red; 
}
</pre>

####3.2属性嵌套

<pre>
body{
    header {
        color: red;
    }
    footer {
        background: {
            color: green;
            size: 20%;
        };
    }
}
</pre>
 编译后结果：
 <pre>
 body footer {
  background-color: green;
  background-size: 20%; }
 </pre>
 
#####3.3引用父选择器 &
 
 <pre>
 body{
    a {
        color: red;
        &:hover{
            color: green;
        }
    }
}
 </pre>
 
 编译后的结果：
 <pre>
 body a {
  color: red; }
  body a:hover {
    color: green; }
 </pre>
 
#####3.4 @at-root ，跳出嵌套
 
 - 默认@at-root只会跳出选择器嵌套，而不能跳出@media 或 @support；
- 若要跳出，则需要@at-root(without:media) | @at-root(without:support)
- 其中还有:all  表示所有  ； rule表示常规css

<pre>
body{

    header {
        color: red;

        @at-root .container {
            width: 100px;
        }
    }
    footer {
        background: {
            color: green;
            size: 20%;
        };


    }
}
</pre>

编译后的结果：
<pre>
body header {
  color: red; }
  .container {
    width: 100px; }
body footer {
  background-color: green;
  background-size: 20%; }
</pre>

#####3.5 @at-root 与 &混用
<pre>
.text-info {
    color: red;
    @at-root nav &{
        color: blue;
    }
}
</pre>

编译后结果：
<pre>
.text-info {
  color: red; }
  nav .text-info {
    color: blue; }
</pre>

####4.继承
#####4.1简单继承
<pre>
.A{
    background-color: red;
}

.A1 {
    @extend .A;
    color: red;
}
</pre>

<pre>
.A, .A1 {
  background-color: red; }

.A1 {
  color: red; }
</pre>
#####4.2多继承
在简单基础上，类似于@entend .A,.B;
#####4.3链型继承
<pre>
.one {
    color: red;
}
.two {
    @extend .one;
    size: 100px;
}
.three{
    @extend .two;
    border-radius: 10px;
}
</pre>

<pre>
.one, .two, .three {
  color: red; }

.two, .three {
  size: 100px; }

.three {
  border-radius: 10px; }
</pre>
#####4.4继承局限性
- 包含选择器 或者 相邻兄弟选择器 不支持
- 如果继承元素是a,恰巧这个元素a又有hover状态的形式，那么状态hover也会被继承
<pre>
a :hover{
    color: red;
}

.four {
    @extend a;
}

</pre>

<pre>
a :hover, .four :hover {
  color: red; }

</pre>

#####4.5继承交叉合并
没有在同一父级下，会产生交叉编译结果
<pre>
.five a{
 color: red;
}

.six {
    @extend a;
}
</pre>

<pre>
.five a, .five .six {
  color: red; }
</pre>

#####4.6继承的作用域
继承在指令中是有作用域问题的，继承是无法使在指令如(@media)之外的选择器继承的，要是继承就只能写在指令中


#####4.7特别--占位选择器%
有时候你想继承一个类名，但是并不想再在HTML中使用，就单单想写一个能够继承的类名。尤其是不想让它出现在css样式中。我们可以用占位符来写一些继承的样式(如“%one”)，然后再通过@extend继承，这样就可以防止被渲染到CSS的规则集中。

<pre>
.B a%long {
    color: red;
}
.C {
    @extend %long;
}
</pre>

<pre>
.B a.C {
  color: red; }
</pre>


####5.进阶

#####5.1 数据类型
Sass涉及到的数据类型有以下几个：
Number,String,List,Map,Color,Boolean,Null

以上类型基本在实例中见过，不多介绍了，另外存在一些函数查看文档就可以了

##### 5.2变量操作
和其他语言基本类似，不多介绍了

#####5.3 Mixin
@mixin的调用方式是@include,@include产生的样式是以复制拷贝的方式存在的,而@extend产生的样式是以组合申明的方式存在的
<pre>
@mixin  count($color1:red){
    color: color1;
}

body{
    @include count(#fff)
}


</pre>
<pre>
body {
  color: #fff; }
</pre>

如何设置多值参数呢？
<pre>
@mixin  count($color1...){
    color: color1;
}
</pre>

@content应用：
<pre>
@mixin header{ #header{ @content; } }
</pre>
<pre>
@include header{ width:1000px; height:200px; .logo{ width:200px; } }
</pre>
#####5.4函数
 
 - 内置函数
[点开这里自己看吧](http://sass-lang.com/documentation/Sass/Script/Functions.html)
 - 自定义函数
 
<pre>
@function double($width){
    @return $width * 2;
}
</pre>
 
 - @debug,@error,@warn
 用来调试
 
 
#####5.5条件控制
条件关键字如下，没有什么特别的
@if

@for

@while

@each

 
 
 
 ####参考文档
 
 1.[Sass文档](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#nested_rules)
 
 