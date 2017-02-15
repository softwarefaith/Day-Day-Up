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
 
 
 
 