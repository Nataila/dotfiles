" Nataila <nataila.cc.814@gmail.com>
" https://tankywoo.com

"========="
" General "
"========="
set nu " 显示行号
syntax on " 语法高亮
set hlsearch " 搜索高亮
set incsearch " Real-time search
set foldmethod=indent " The kind of folding used for the current window 
"set mouse=a
au BufNewFile,BufRead *.less set filetype=less
"set nowrap " 不自动换行
set foldlevel=99
set nocompatible " Use the vim's keyboard setting, not vi
set cindent
set tabstop=4 " 一次缩进四个字符
set shiftwidth=4
set smarttab
set autoindent " 自动缩进
set softtabstop=4
set smartindent shiftwidth=4
"set expandtab " Use the space to instead of tab
set smartindent
set showmatch " When a bracket is inserted, briefly jump to the matching one
set showmode " Show the mode
set nobackup " 缺省不产生备份文件
set noswapfile " 不产生swap文件
set cursorline " Highlighter the current line
"hi cursorline gui=UNDERLINE cterm=UNDERLINE
set fileencodings=utf-8,gb18030,cp936,big5 " Set the encode
set t_Co=256 " If under tty, use 256
let g:solarized_termcolors=256
set pastetoggle=<F10> "" Bind `F10` to `:set paste`
set autowrite " 自动保存
set ignorecase " 搜索忽略大小写

" Display `tab` and `trail space`
set list
set listchars=tab:>-,trail:.

"========="
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
"========="

map <F3> :tabnew .<CR> " 列出当前文件
nmap <F8> :TagbarToggle<CR>
" Tagbar
map <leader>tb :Tagbar<CR>
map <leader>tbc :TagbarClose<CR>"

" NOTE: vim <leader> default is `\`, can `:help <leader>` to see more.

" Not display above list
nmap <leader>l :set list!<CR>

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" cc is only exist in `Vim7.3`
set cc=81 " Short for colorcolumn

" Auto add head info
" .py file auto add header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1,  "# -*- coding: utf-8 -*-")
    call append(2,  "# Nataila @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" .sh file auto add header
function HeaderBash()
    call setline(1, "#!/bin/bash")
    call append(1,  "# Nataila @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

"======================"
" Bundle Configuration "
"======================"

set rtp+=~/.vim/bundle/vundle/

filetype plugin indent on     " required!

"================"
" Color Settings "
" ==============="
set t_Co=256

try
    set background=dark
    "colorscheme Tomorrow-Night-Bright
    colorscheme nataila
    "highlight Nornal ctermbg=NONE
    "highlight NonText ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

" Highlight TODO/FIXME/XXX
highlight myTodo cterm=bold term=bold ctermbg=blue ctermfg=black
match myTodo /TODO/
highlight myFixme cterm=bold term=bold ctermbg=red ctermfg=black
match myFixme /FIXME/
highlight myXxx cterm=bold term=bold ctermbg=blue ctermfg=black
match myXxx /\(XXX\|FIXME\)/

 " nnoremap to :tabnew<cr>
  nnoremap tn :tabnext<CR>
  nnoremap tp :tabprev<CR>
 " nnoremap tc :tabclose<CR>
 " nnoremap tm :tabmove<CR>
 " nnoremap tf :tabfirst<CR>
 " nnoremap tl :tablast<CR>

  hi Comment ctermfg =blue
  hi String ctermfg =darkred
  hi Number ctermfg = green
  hi Constant ctermfg = darkyellow

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "wookiehangover/jshint.vim"
Bundle 'gmarik/vundle'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'othree/html5.vim'
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'


Bundle 'kchmck/vim-coffee-script'
let coffee_indent_keep_current = 1

set completeopt=longest,menu


" pypdiction
let g:pydiction_location = 'Users/nataila/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

" NERDTree
nmap <leader>tne :NERDTree<CR>
nmap <leader>ttne :NERDTreeClose<CR>

" neocomplcache 智能补全
let g:neocomplcache_enable_at_startup = 1

Bundle 'jelera/vim-javascript-syntax'

 
" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
 
" 设置Gvim的对齐线样式
let g:indentLine_char = "┊"
 
" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
"let g:indentLine_color_term = 9

call pathogen#infect()
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
"set tags=tags  
"set autochdir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"默认打开Taglist 
let Tlist_Auto_Open=0 
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
nmap tl :Tlist<cr>
