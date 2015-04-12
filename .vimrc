"vim自带的选项设置,前三个选项不同情况下可能需要修改
if filereadable("cscope.out")        "打开工程时自动加载已经建立的索引文件，如果系统里自带的vim脚本已经带了这个，需要删除
	cs add cscope.out
endif
set background=dark                  "如果背景是浅色，将dark改成light
set t_Co=256                         "如果终端支持256色，打开这个选项会让语法着色更漂亮，如果终端不支持256色，颜色会变难看
:colorscheme desert                  "语法高亮
syntax on                            "打开语法高亮
set ruler                            "在屏幕的下面显示在第几行第几列，我觉得这个就够了，所以没有打开行号显示
set hlsearch                         "用/搜索时会高亮搜索单词
set incsearch                        "用/搜索时会时时定位关键词位置
set nobackup                         "不产生备份文件，在windows下保存文件后会默认生成一个原文件的备份
set showmatch                        "显示光标下大小括号的对应的那部分
set matchtime=0                      "时时显示光标下括号对应部分，不加这一行，不是时时
set laststatus=2                     "状态栏任何情况下都显示
set updatetime=1000                  "在tagbar显示的函数列表里会高亮当前光标所在的函数，如果不加这一行，高亮的反映会是4s
set tabstop=4                        "vim默认tab是8个长度，改成4个
set shiftwidth=4                     
set softtabstop=4
set list lcs=tab:\|\                 "将tab显示成绿色竖线，写python的时候帮助很大
set fileencodings=utf-8,cp936        "自动检测文件是utf8还是cp936
set fileformats=dos,unix,mac         "自动检测文件是dos,unix,mac，主要是换行符不同
set nocompatible                     "不兼容vi,一些插件需要
set backspace=indent,eol,start       "到一行的开头还能继续按backspace
set cindent                          "按语法缩进
set cinoptions=g0,:0                 "vim的按语法缩进public等标识行开头会空一个tab，加上这句不再空。
filetype plugin indent on            "部分插件需要
autocmd FileType python set tabstop=4 | set list lcs=tab:\|\   "python在部分vim上tab会有问题，加上这句可以解决

"插件的选项设置
let NERDTreeAutoCenter=1
let NERDTreeQuitOnOpen=1          
let NERDTreeWinPos=1
let NERDTreeDirArrows=0
let NERDRemoveExtraSpaces=0
let NERDRemoveAltComs=0
let g:tagbar_left=1
let g:tagbar_sort=0
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_foldlevel=1 
let g:tagbar_iconchars=['+', '-']
set completeopt=menuone,longest
let OmniCpp_SelectFirstItem = 2
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteDot = 1   
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1

"设置快捷键
"文件树列表
map <F2> :NERDTreeToggle<cr>                                
"函数列表
map <F3> :TagbarToggle<cr>
"头文件和实现文件切换
map <F4> :A<cr>
"更新索引
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>:if filereadable("cscope.out")<cr>cs kill cscope.out<cr>endif<cr><cr>:!cscope -Rbk<cr><cr>:cs add cscope.out<cr>
"更新索引,只更新cscope
map <F6> :if filereadable("cscope.out")<cr>cs kill cscope.out<cr>endif<cr>:!cscope -Rbk<cr><cr>:cs add cscope.out<cr>
"用python运行这个文件
map <F9> :!python %<cr>
"在没有未保存文件的情况下退出全部vim
map <F10> :qa<cr>
"跳转到当前光标下单词声名或定义的位置，只有一个匹配时，让ctags直接跳转，如果有多个则显示列表
nnoremap <c-]> g<c-]>                                         
"移动到右边窗口
noremap <c-l> <c-w>l                                         
"移动到上边窗口
noremap <c-k> <c-w>k                                              
"移动到下边窗口
noremap <c-j> <c-w>j
"移动到左边窗口
noremap <c-h> <c-w>h
"搜索当前光标下单词在工程中哪里出现过，不包括字符串
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>        
"搜索当前光标下单词在工程中哪里定义，不包括字符串
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"搜索调用这个函数的函数
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"搜索当前光标下单词工程中哪里出现过，包括字符串
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"搜索当前光标下单词工程中哪里出现过，包括字符串，支持正则表达式
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"跳转到当前光标下单词对应的文件,这个功能很强大
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"跳转到包含光标下单词对应文件的文件,这个功能很强大
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"跳转到包含当前文件的文件,这个功能很强大
nmap <C-@>I :cs find i ^<C-R>=expand("%")<CR>$<CR>
"搜索被这个函数调用的函数
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
