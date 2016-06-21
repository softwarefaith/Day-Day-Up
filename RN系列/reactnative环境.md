#ReactNative环境搭建

##1.配置

###1.1 Homebrew安装

Homebrew是OS X不可获取的套件管理器，我们可以通过它获取并且安装很多组件，安装方式：<br/>

<pre>ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"</pre>

最后通过命令执行  ***brew -v*** 查看Homebrew版本号。


###1.2 nvm && Node.js
管理多版本Note<br/>
具体项目地址<https://github.com/creationix/nvm><br/>

安装方式：
<pre>
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
</pre>
另外需要在.bash_profile文件中配置环境变量，通过***nvm --version***查看版本<br/>
安装Node.js
<pre>
nvm install node && nvm alias default node
</pre>
具体操作内容移步[这里](http://www.tuicool.com/articles/Vzquy2),介绍了npm多版本管理的方式<br/>
***NOTE***如果现在采用是Node5.0版本的版本，官网是推荐安装npm 2，该版本比npm 3速度更加快。在安装完Node之后，命令行运行npm install  -g npm@2安装即可。


###1.3 watchman
该用于监控bug文件，并且可以触发指定的操作,安装方式如下
<pre>
sudo brew install watchman
</pre>


###1.4 flow
flow是一个 JavaScript 的静态类型检查器，建议安装它，以方便找出代码中可能存在的类型错误，官网:<http://www.flowtype.org/>
<pre>
sudo brew install flow
</pre>


***Note***
如果遇到错误，直接copy，百度，别问我为啥不用google.

###1.5 RN安装
<pre>
npm install -g react-native-cli
</pre>

#2.安装

###2.1初始化项目
初始化方式
<pre>
react-native init AwesomeProject
</pre>
生成的目录结构:
![程序目录结构](目录结构.png)

#3 RN开发环境IDE



##参考内容
1.npm多版本管理<http://www.tuicool.com/articles/Vzquy2>
