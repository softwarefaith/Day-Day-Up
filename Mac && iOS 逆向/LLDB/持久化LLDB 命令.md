#持久化LLDB 命令

###了解lldb初始化文件加载
LLDB会在下面几个地方查找初始化文件:

<pre>~/.lldbinit-[context]</pre> 其中 [context]位置的内容是Xcode, 如果你使用Xcode调试, 或者是lldb如果你通过命令行用LLDB调试.例如, 如果你在终端中调试但是希望命令只在LLDB中生效, 你需要加上的内容是~/.lldbinit-lldb, 同时如果你希望命令只在Xcode中生效你需要使用~/.lldbinit-Xcode.

接下来, LLDB会搜索在~/.lldbinit中找到的内容. 这里是处理大多数逻辑的理想文件, 如果你想在终端中或者Xcode中使用LLDB命令的话.

###自定义命令

####步骤
<pre>
1. touch ~/.lldbinit (创建)
2. vi ~/.lldbinit
3. 编写自定义命令
4. 保存退出
</pre>

####别名创建

<pre>
command alias aliasName  ...
</pre>


###命令正则式

<pre>
 command regex myCommand 's/<regex>/subst/'
</pre>

示例
<pre>
(lldb) command regex rlook 's/(.+)/image lookup -rn %l/'
</pre>

<pre>
(lldb) command regex getcls 's/(([0-9]|\$|\@|\[).*)/cpo [%l class]/'  's/(.*)/expression -l swift -O -- type(of:%l)/'
</pre>



