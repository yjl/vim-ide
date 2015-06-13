colorscheme desert              
syntax on                       
filetype plugin indent on        "some plugin need it
set background=dark "dark light  "if you console background is white make it light
set nocompatible                 "some plugin need it
set hlsearch                     "highlight the search
set incsearch                    "move to fit position after one char input
set nobackup                     "won't produce the backup file when save file
set hidden                       "can open other file when a file is not saved
set showmatch matchtime=0        "show the other bracket
set laststatus=2                 "status bar will show anytime
set updatetime=800               "tagbar response 800ms
set expandtab tabstop=4          "expand the tab to 4 space
set shiftwidth=4                 "make the indent 4 length    
set softtabstop=4                "backspace can del 4 space
set lcs=tab:\|\                  "display tab to green line
set backspace=indent,eol,start   "better backspace
set fileencodings=utf-8,cp936    "auto test the file is uft-8 or cp936
set fileformats=unix,dos,mac     "line feed different in different mode
set ci cinoptions=g0,:0          "some indent rules

highlight default link TagbarHighlight  Title
let NERDTreeQuitOnOpen=1                                                   
let NERDTreeWinPos=1
let NERDTreeDirArrows=0
let NERDRemoveExtraSpaces=0
let g:tagbar_left=1
let g:tagbar_sort=0
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_foldlevel=1 
let g:tagbar_iconchars=['+', '-']
set completeopt=menuone,longest
let OmniCpp_SelectFirstItem = 2
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteScope = 1

"file list
map <F2> :NERDTreeToggle<cr>                                
"tarbar function list
map <F3> :TagbarToggle<cr>
"header and implement file switch
map <F4> :A<cr>
"update index
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>:cs kill cscope.out<cr>:!cscope -Rb<cr><cr>:cs add cscope.out<cr>
"switch paste mode
map <F6> :set paste!<cr>:set paste?<cr>
"highlight
map <F7> ms:%s /\<<C-R>=expand("<cword>")<CR>\>//gn<cr>`s
"swapfile list
map <F8> \be
"show list if more tag 
nnoremap <c-]> g<c-]>                                         
"move to right window
noremap <c-l> <c-w>l                                         
"move to up window
noremap <c-k> <c-w>k                                              
"move to down windown
noremap <c-j> <c-w>j
"move to left window
noremap <c-h> <c-w>h
"goto the place where word definition
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"list the funcion called by this function
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"list the position where to call this word
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"search word in the project
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>        
"search word in the project and the word can be in text
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"search word in the project and the word can be in text, support regex
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"list the file which filename is this word
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"list the file include the file which filename is this word
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"list the file which include this file
nmap <C-@>I :cs find i ^<C-R>=expand("%")<CR>$<CR>

if has("cscope") 
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
endif
