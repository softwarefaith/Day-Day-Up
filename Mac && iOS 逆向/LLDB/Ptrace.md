#Ptrace

###介绍
   Ptrace:系统调用，由kernel提供的底层服务,具体指用户空间frameworks功能,比如 UIKit
   <pre>
     终端输入如下命令，打印出使用系统调用的数量
     sudo dtrace -ln 'syscall:::entry' | wc -l   
   </pre>
   
   <pre>
   监听进程参数
   sudo dtrace -qn 'syscall::ptrace:entry { printf("%s(%d,%d,%d,%d) from %s\n",probefunc,arg0,arg1,arg2,arg3,execname);}'
   </pre>