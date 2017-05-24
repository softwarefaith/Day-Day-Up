#JS全栈学习笔记一

##HTTP协议—

***从浏览器输入网址到网页展示出来的，流程：***
***浏览器***： DNS解析   根据HTTP协议封装首部字段
***网络传输***：建立网络连接 发送数据
***服务器***：服务器返回数据给浏览器
***网络返回***:浏览器解析：  浏览器解析和渲染HTML


###数据通讯格式<br/>
###请求地址和方法<br/>
 HEAD方法：获得首部字段， 不想获取具体内容
 POST：
 GET：
  
###首部字段<br/>

Host:<br/>
Referer:<br/>
Cache-Control<br/>
   no-cache 下次必须访问<br/>
   no-store 不缓存资源<br/>
   max-age  存活生命周期<br/>
   
Content-Type<br/>
Content-Lengh<br/>
Location  301跳转    跳转的位置<br/>

###常用状态码： <br/>
1XX ：信息 ；   101更换协议<br/>
2XX:成功  <br/>
3XX:重定向      301永久      302临时  304 资源未修改<br/>
4XX:客户端错误   400语法错误  401验证  403拒绝  404 找不到服务器<br/>
5XX:服务器错误   500程序     502 网关  503不可用  504超时<br/>

###浏览器的调试<br/>

##浏览器解析HTML原理<br/>

##DOM结构<br/>
document表示DOM，是window的属性<br/>
####DOM节点
网页是由不同的DOM的节点组成
+整个文档是一个文档节点
+元素节点
+文本节点
+属性节点
+注释节点
####DOM树
##HTML基础结构<br/>

	<html>

		<head> 
			<title>网页的标题信息</title>
    		<meta>
    		<link>
    		<style>...</style>
    		<script>...</script>
		</head>
		
		<body>
		
		</body>


	</html>



A的伪类：用于向被选中元素添加特殊效果。<br/>
link 未访问（默认） -- hover  鼠标悬停（鼠标划过） -- active 链接激活（鼠标按下） -- visited 访问过后（点击过后）<br/>
顺序：link visited hover active

常见标签
块与内嵌的互换：   display:  inline  or block
块的特征：默认独占一行，没有宽度时默认成满一排，支持所有css命令
内嵌的特征： 同排可以继续跟同类的标签 内容撑开宽度 不支持宽高 不支持上下的margin and padding 代码换行被解析
inline-block:块在一行显示，行内属性标签支持宽高
#####选择符
  id（#) 群组（,）class(.) 类型选择符(div...） 包含选择符(div p) 通配符（*）
  优先级： 类型 < class < id < style（行间） < js
 选择符使用规则：准确选中元素，又不影响其他
#####表格<br/>

###语义与非语义页面对比  
结构层次
 
##前端规范<br/>
 
 