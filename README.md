目录

    使用范围
    安装及更新方法
    自己总结的浏览和编写C/C++工程的使用方法
    使用到的插件
    对比
    Story、方向与愿景


使用范围
    
    系统要求：vim 7.2及以上版本，完美支持linux, mac, cygwin.
    功能：浏览和编写c/c++, python项目
    特点：安装绿色简单，功能可比source insight，但保持了原汁原味的vim。


安装及更新方法

    (确保设备已经联网)
    1.centos, redhat, fedora安装命令：
      yum install ctags cscope wget unzip -y && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master
    2.debian, ubuntu安装命令：
      apt install ctags cscope wget unzip -y && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master
    3.mac安装命令,要求已经安装brew, wget和unzip：
      brew install ctags cscope -y && hash ctags cscope wget unzip && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master

    (上面的命令的实际操作是安装ctags、 cscope、 wget和unzip, 同时下载vim配置文件和插件解压到家目录下)


自己总结的浏览和编写C/C++工程的常规的使用方法 

    打开项目:
        cd到工程根目录下，vim (回车),必须是工程根目录。按F2打开文件列表，选择文件打开。
    建立索引：
        第一次打开项目，及代码更新后按F5更新索引，这个索引与source insight中的更新索引意义相同。
    浏览C/C++代码:
        浏览代码会常用的几个功能:
        1.跳转
            F3         通过tagbar函数列表跳转到当前文件的某个函数
            ctrl-]     跳转到光标下单词在工程中定义的位置
            gd         如果光标下单词是局部变量，按这个跳转到它定义的位置
            :tag word  跳转到word定义的位置     
            ctrl-2 g   跳转到光标下单词在/usr/include中定义的位置
            ctrl-h, j, k, l 光标在各个窗口间跳转
            %          在一个大小中括号跳转到对应括号
            [[         跳转到当前函数的开头
            ][         跳转到当前函数的结尾
            ctrl-o     回退到光标之前的位置。
            ctrl-i     按ctrl-o后返回。
        2.搜索
            ctrl-[ s   在整个工程里面搜索光标下单词，但不包括字符串和注释。
            ctrl-[ t   在整个工程里面搜索光标下单词，包括字符串和注释。
            :cscope find t word  在工程中搜索字符串word。
            <F7>       高亮光标下单词
            /word      搜索单词word
        3.切换到工程下的另一个文件
            F2         通过文件树跳转。
            F8         已经打开的文件列表
            F4         在头文件和实现文件两个文件切换。
            ctrl-[ f   跳转到文件名含有光标下单词的文件。
            ctrl-[ i   跳转到包含光标下单词对应文件的文件。
            ctrl-[ I   跳转到包含当前文件的文件。
    编写C/C++代码：
        1.替换功能
            :%s /word1/word2/g 将这个文件里的word1替换成word2。
        2.对齐代码
            =          对齐选中行代码
            ==         对齐当前行代码
            gg=G       对齐整个文件
        3.注释及反注释
            ,          注释选中行
            .          反注释选中行


使用到的插件    

    tagbar         #函数变量列表（修改部分BUG，修改配置文件）
    nerdcommenter  #注释功能（修改C语言默认用//注释，修改配置文件）
    a              #切换头文件和实现文件（修改跨目录不能找到的问题，无修改配置文件）
    nerdtree       #目录树（无修改，修改配置文件）
    omnicpp        #C/C++的自动补全插件（无修改，修改配置文件）
    bufexplorer    #当前打开的文件列表（无修改，修改配置文件）
    AutoComplPop   #自动弹出补全菜单 （无修改，修改配置文件）
    SuperTab       #按tab补全 （无修改，修改配置文件）


对比

    souce insight:通过Linux上的samba服务去写Linux主机里的代码，或者在windows上用source insight写完代码后再传到linux上。
    eclipse:很好用，但不得打开Linux图形界面，另外eclipse运行很慢，尤其大项目。
    qt creator:即使不是QT项目，当然也可以在Linux图形界面用QT creator写代码，比eclipse运行快。
    codeblocks:也跟eclipse和qtcreator一样,要在linux下的图形界面下使用，用的不多，不做评价。
    VIM与EMACS:作为开发环境都要加跳转及自动补全类的插件。不需要打开图形界面,不需要鼠标,能一键搜索。另外它们都可以直接ssh到Linux主机直接使用。VIM与EMACS都可以无界限的加任何功能的插件。从基本操作上个人还是更喜欢emacs，但vim更容易定制到自己希望的样子。


愿景与方向

    每个人可以用特别少的学习成本在终端上特别方便的写代码。
    用更少的学习成本就可以有更多的便利和更好的用户体验，同时保持安装过程以及这些配置文件更好的简洁性。
