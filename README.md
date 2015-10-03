目录

    使用范围
    安装及更新方法
    自己总结的浏览和编写C/C++工程的使用方法
    方向与愿景
    FAQ


使用范围
    
    系统要求：vim 7.2及以上版本，完美支持linux, mac, cygwin.
    功能：浏览和编写c/c++, python项目
    特点：安装绿色简单，功能可比source insight，但保持了原汁原味的vim。


安装及更新方法

    (确保设备已经联网)
    1.centos, redhat, fedora安装命令：
      yum install ctags cscope wget unzip -y && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master
    2.debian, ubuntu安装命令：
      apt-get install ctags cscope wget unzip -y && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master
    3.mac安装命令,要求已经安装brew, wget和unzip：
      brew install ctags cscope -y && hash ctags cscope wget unzip && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master

    (上面的命令的实际操作是安装ctags、 cscope、 wget和unzip, 同时下载vim配置文件和插件放到到家目录下，会自动清除临时文件)


自己总结的浏览和编写C/C++工程的常规的使用方法 

    打开项目:
        cd到工程根目录下，vim (回车),必须是工程根目录。按F2打开文件列表，选择文件打开。
    建立索引:
        第一次打开项目，及代码更新后按F5更新索引，这个索引与source insight中的更新索引意义相同。
    浏览C/C++代码:
        浏览代码会常用的几个功能:
        1.跳转
            F3         通过tagbar函数列表跳转到当前文件的某个函数
            ctrl-]     跳转到光标下变量或函数在工程中定义的位置。(局部变量不能跳转) (:ts word)
            gd         跳转到局部变量定义的位置
            [[         跳转到当前函数的开头
            ][         跳转到当前函数的结尾
            ctrl-o     回退到光标之前的位置。
            ctrl-i     按ctrl-o后返回。
            ctrl-h, j, k, l 光标在各个窗口间跳转
        2.搜索
            ctrl-[ s   在整个工程里面搜索光标下单词，但不包括字符串和注释。 (:cs find s word)
            ctrl-[ t   在整个工程里面搜索光标下单词，包括字符串和注释。 (:cs find t word)
            <F7>       高亮光标下单词
            /word      搜索单词word
        3.切换到工程下的另一个文件
            F2         通过文件树跳转。
            F8         已经打开的文件列表
            F4         在头文件和实现文件两个文件切换。
    编写C/C++代码：
        1.替换功能
            :%s /word1/word2/g 将这个文件里的word1替换成word2。
        2.对齐代码
            =          对齐选中行代码
            ==         对齐当前行代码
        3.注释及反注释
            ,          注释选中行
            .          反注释选中行


愿景与方向

    每个人都可以用特别少的学习成本在终端上特别方便的读写代码。
    用更少的学习成本就可以有更多的便利和更好的用户体验，同时保持安装过程以及这些配置文件更好的简洁性。


FAQ

    1、问什么不让行号默认显示？
        右下角已经有了，不仅有行号，还有列号。
    2、按tab键默认输入4个空格还是一个tab?
        按tab键会输入4个空格，默认的行首缩进也是4个空格。如果项目要求是行首缩进是一个tab,将配置文件set expandtab改为set noexpandtab。
    3、tagbar怎么没有颜色了，默认的有？
        给去掉了，tagbar的颜色是会在文件输入时，时时运行正则表达式，会在自动补全时拖慢速度。
    4、自动补全怎么选择，怎么确认最好？
        按上下键选择，按回车键补全。
    5、自动补全只有在输入. -> :: 时才弹出?
        在输入一半单词时，按tab也会弹出。
    6、相当于windows里的ctrl-z的撤销，在vim里怎么做？
        u是撤销，ctrl-r是重做。
    7、之前也用ctags、cscope,使用命令更新索引，这个F5更新索引与是用命令的区别是什么？
        这个命令会把ctags,cscope两个索引都更新了，没有区别。
    8、打开一个工程，已经更F5新好索引，怎么跳转main函数？
        :ts main
    9、怎么对齐nginx的配置文件？
        gg=G可以对其整个文件，但vim默认配置对齐后会让注释行没有缩进。用这个配置文件没有这个问题。
    10、vim的复制粘贴？
        先按v或shift-v，选中一些内容，按y复制，把光标移动到想要粘贴的位置，按p。
    11、为什么没有把youcompleteme集成进来？
        我的评估结果是，他的复杂度大于实用度。而且现在的补全我觉得已经太够用了。
    12、diff命令或svn diff命令出来的东西没有语法着色？
        diff ***** | vim - 或
        svn diff **** | vim -
        当然其他输出到终端的东西加上 | vim -也可以。
        '|'的意思是把上个命令的stderr和stdout，作为下一个命令的stdin。
        '-'的意思是把stdin作为一个文件打开
    13、这个配置文件在搜索跳转补全等方面对c++支持怎么样？
        非常好
    14、vim用了这个配置文件后跟sourceinsight等工具对比怎么样？
        souce insight:通过Linux上的samba服务去写Linux主机里的代码，或者在windows上用source insight写完代码后再传到linux上。
        eclipse:很好用，但不得打开Linux图形界面，另外eclipse运行很慢，尤其大项目。
        qt creator:即使不是QT项目，当然也可以在Linux图形界面用QT creator写代码，比eclipse运行快。
        codeblocks:也跟eclipse和qtcreator一样,要在linux下的图形界面下使用，用的不多，不做评价。
        VIM与EMACS:作为开发环境都要加跳转及自动补全类的插件。它们都可以直接ssh到Linux主机直接使用,不需要打开图形界面。VIM与EMACS都可以无界限的加任何功能的插件。从基本操作上个人还是更喜欢emacs，但vim更容易定制到自己希望的样子。
    15、这份配置文件里用了哪些vim插件，这些插件是否是原生的?
        tagbar         #函数变量列表（修改部分BUG，修改配置文件）
        nerdcommenter  #注释功能（修改C语言默认用//注释，修改配置文件）
        a              #切换头文件和实现文件（修改跨目录不能找到的问题，无修改配置文件）
        nerdtree       #目录树（无修改，修改配置文件）
        omnicpp        #C/C++的自动补全插件（无修改，修改配置文件）
        bufexplorer    #当前打开的文件列表（无修改，修改配置文件）
        AutoComplPop   #自动弹出补全菜单 （无修改，修改配置文件）
        SuperTab       #按tab补全 （无修改，修改配置文件）
