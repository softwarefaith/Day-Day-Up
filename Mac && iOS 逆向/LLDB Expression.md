#LLDB Expression

### P VS  PO

P:“expression  -- “ 的别名

PO：oc里所有的对象都是用指针表示的，打印出来的是对象的指针，而不是对象本身，可以采用 -o 来打印对象本身  为了更加方便的时候，LLDB为 “expression -o —”  定了一个别名 ：po


### 语言上下文环境

LLDB调试应该时刻注意***当前调试器当前停在什么样的语言环境里***。
Note:在蓝色断点外面停下会让LLDB进入Objective-C环境

Swift语言环境中
<pre>
 po UIApplicaton.shared
</pre>
Swift ->  Objective-C  使用如下命令
<pre>
expression -l objc -O -- [UIApplication sharedApplication]
</pre>

###自定义变量
在OC Debugger环境中创建变量
<pre>
(lldb) po id $test = [NSObject new];
(lldb) po $test
</pre>
而在Swift环境创建变量
<pre>
(lldb) expression -l objc -o -- id $test = [NSObject new];
(lldb) po $test
</pre>
其中 $ 字符目的是为了LLDB记住此变量

###类型转换
<pre>
• B: boolean
• b: binary
• y: bytes
• Y: bytes with ASCII
• c: character
• C: printable character
• F: complex float
• s: c-string
• i: decimal
• E: enumeration
• x: hex
• f: float
• o: octal
• O: OSType
• U: unicode16
• u: unsigned decimal
• p: pointer
</pre>

<pre>
 (lldb) p/t 10.0
</pre>

格式自定义