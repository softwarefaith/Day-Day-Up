#BOM

##什么是BOM
BrowerObject Module
API
##属性

- navigation 浏览器信息

   platform && userAgent

- location 浏览器定位与导航

 href
 assian(url)  载入新的url，记录
 replcare()   不记录
 reload()     重新加载
 
    
- history 窗口浏览器历史

 back()
 forward()
 go()
 

-  screen 屏幕信息

availHeight
height

##方法

1三种对话框

- alert
- confirm
- prompt

2计时器
- setTimeout()
- setInterval()

3 窗口关闭与打开
var w = window.open(“”);
w.close(“”)

##事件

- load   文档和所有图片加载完毕
- unload 离开当前文档
- beforeunload 和unload一样，但他提供询问用户是否确定离开的机会
- resize 拖动改变浏览器窗口大小时
- scroll 拖动滚动浏览器


