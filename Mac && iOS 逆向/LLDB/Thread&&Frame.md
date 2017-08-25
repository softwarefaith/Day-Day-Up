#Thread Frame

###调试基本命令

打印线程信息
<pre>
(lldb)thread backtrace == bt
</pre>
帧信息
<pre>
(lldb) frame info
</pre>
跳到某一帧
<pre>
(lldb) frame select MyNum(自己修改)
</pre>

断点跳转
<pre>
{Stepping over} : (lldb) run (lldb)next
{Stepping in} : (lldb) run (lldb)step
{Stepping out} : (lldb)finish
</pre>
查看栈内变量
<pre>
 frame variable
</pre>
查看私有变量
<pre>
 frame variable -F  MyObject(自己修改)
</pre>

thread until, thread jump和thread return