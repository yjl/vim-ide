Content

    where use it
    how to install and update
    how to use it read and write c/c++ project
    hope
    FAQ


where use it
    
    System requirements：vim 7.2 or higher，support linux、 mac、 cygwin.
    funciton：browse c/c++, python project
    difference：one command to install，the experience is as much as source insight，but it't a simple vim. beside script, it only need ctags ans cscope.


how to install and update

    (insure the computer has connect to internet)
    1.centos, redhat, fedora install or update command:
      yum install ctags cscope wget unzip -y && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master
    2.debian, ubuntu install or update command:
      apt-get install ctags cscope wget unzip -y && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master
    3.mac install or update command, insure has installed brew, wget and unzip：
      brew install ctags cscope -y && hash ctags cscope wget unzip && wget https://github.com/langsim/vim-ide/archive/master.zip -O master.zip && unzip -o master.zip && cp -rf vim-ide-master/.vim* ~ ; rm -rf master.zip vim-ide-master

    (the command will install ctags、 cscope、 wget and unzip, at the same time it will download vim script into home dir and remove temp file)


how to use it read and write c/c++ project

    open project:
        cd into project root dir，vim (press enter button), must in project root dir. press F2 to open file tree, and select file to open.
    create index:
        first open project or update some code in project, press F5 to update index，the index function is same to source insight index.
    read c/c++ code:
        1.jump
            F3         throught tagbar to jump to another function in the file
            ctrl-]     jump to variable or function defination in project。(can't jump to local variable defination) (:ts word)
            gd         jump to local varibale defination
            [[         jump to start of function
            ][         jump to end of function
            ctrl-o     jump to cursor last position
            ctrl-i     return after press ctrl-o
            ctrl-h, j, k, l      move to another window in vim
        2.search
            ctrl-[ s   search variable or function in project (:cs find s word)
            ctrl-[ t   search text in project (:cs find t word)
            <F6>       switch of display invisible character or not 
            <F7>       highlight word under the cursor 
            /word      search word in the file
        3.open another file in project
            F2         throught file tree
            F8         throught opened file list
            F4         switch of include file and implement file
    write c/c++ code：
        1.align
            =          align selected code
            ==         align current line code
        2.comment
            ,          comment selected code
            .          uncomment selected code
        3.replace
            :%s /word1/word2/g  replace word1 to word2 in the file


hope

    every one can read and write code in terminal easily and conveniently, and consume less cpu cycle.


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
