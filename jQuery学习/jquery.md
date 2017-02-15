#jQuery

##简介

网站:<http://jquery.com>

基础教程:<http://www.w3school.com.cn/jquery/>

API文档:<https://api.jquery.com>

##安装入门

##选择器初步

##### basics

##### Hierarchy

##### Basic Filters

##选择器高阶

##### Content Filters

e:contains(second-level)
:empty
e:has(other-e)
e:parent

##### Visibility Filters
:hidden
:visible

##### Attribute Filters
e[class]
e[xx=""]
e[xx != ""]
e[xx ^= ""]  ^开始字符
e[xx $= ""]  $结尾
e[xx *= ""]  *任意多个
e[xx][][]  多条件

##### child Filters
e:first-child
e:last-child
e:nth-child(even)
e:nth-child(n)
e:code-child


##### Forms
:input
:text
:password
:radio
:checkbox
:submit
:image
:reset
:button
:file

##### Form Filters
input:enabled
:disabled
:checked
:selected


##事件处理

####Event handlers

- ready()
- blur()
- focus()
- click()
- dblclick()

- mousedown()
- mouseup()
- mousemove()
- mouseover()
- mouseout

- keydown()
- keypress()
- keyup()

- change()
- submit()


####Event Object Properties


- event.allkey
- event.ctrlKey
- event.keyCode
- event.data
- event.pageX
- event.pageY
- event.screenX
- event.screenY
- event.shiftKey
- event.target
- event.timeStamp
- event.type


##dom操作

#####获取设定内容
- html()
- text()
- val()

传入参数为设定值
传入function

#####获取设定属性	

- attr()
- removeattr()

#####获取设定css class
- addClass()
- removeClass()
- hasClass()
- toggleClass() 无则加，有则删除


#####获取设定css style
- css()

一个值为get
多个值为set

#####apprend and prepend methods
#####apprendTo() and prependTo() methods
#####before and after methods
#####remove, empty and detach method
#####insertBefore and insertAfter() methods
#####wrapInner(),wrap(),wrapAll(),unwarp()
#####replaceWith() and replaceAll()
target.repalceWith()
replaceAll(target)
#####clone and Cloning Event Handlers and Data




##动画效果

##Ajax异步请求

##jQuery ui widget

##jQuery编程规范

##实践