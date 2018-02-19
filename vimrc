"=======================================
"Environment:Ubuntu_16.04_64
"File:vimrc
"Description:VimSimpleIDE configuration file. VimSimpleIDE配置文件
"Author:NoodleZen <noodlezen@sina.com>
"Created:2018.02.08
"Maintainer:NoodleZen <noodlezen@sina.com>
"Version:1.2.0
"Modified:2018.02.19
"=======================================


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on   " 自动语法高亮
set nocompatible   " 关闭vi兼容模式
set showcmd
set ruler " Always show current position 打开状态栏标尺
set cul   " highlight current line 突出显示当前行
set number   "显示行号"
set history=2000   " Sets how many lines of history VIM has to remember 设置需要记住的历史行数
"set mouse=a   "启用鼠标"
set clipboard+=unnamed           " share clipboard with windows
set autochdir                    " auto change windows cwd to file's dir
"set autowrite                   " auto save file
set autoread                     " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start " change backspace:same as windows, backspace over everything in insert mode, same as set backspace = 2
set whichwrap+=<,>,h,l          " Automatically go to next line
set iskeyword+=_,$,@,%,#,-      " don't change line if has these keyword
set encoding=utf-8  " how vim shall represent characters internally"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map leader & mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader   = ","
let g:mapleader = ","
"" press <leader>r: search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"" go to the next search result do: <leader>n
map <leader>n :cn<cr>
"" go to the previous search results do: <leader>p
map <leader>p :cp<cr>
"" open taglist, show all functions, parameters
map <leader>tag :TlistToggle<CR>
"" open NERDTree, tree of working directory
map <leader>tree :NERDTreeToggle<CR>
"" open undotree, undo and redo
map <leader>undo :UndotreeToggle<CR>
"" open indent line
map <leader>line :IndentLinesToggle<CR>
" Use CTRL-S for saving, also in Insert mode
nmap <C-s> :w<CR>
vmap <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>li


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file type
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin indent on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search file 文件搜索
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch  "  increament search: like search in modern browsers
set hlsearch   "  Highlight search results
set ignorecase "  Ignore case when searching
set smartcase  "  When searching try to be smart about cases
set magic      "  For regular expressions turn magic on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" space and tab and indent 空格和tab缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4    "  1 tab == 4 spaces
set shiftwidth=4 "  1 tab == 4 spaces
set expandtab    "  Use spaces instead of tabs
"" show ALL white spaces as dot
set listchars=trail:·
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code folding 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置快捷键
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
"设置宽度
let NERDTreeWinSize=28
"显示行号
"let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1
"是否显示隐藏文件
let NERDTreeShowHidden=1
"在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"显示书签列表
let NERDTreeShowBookmarks=1
"忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"" open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
"改变nerdtree的箭头
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set Autopep8 自动格式化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autopep8_disable_show_diff=1 "禁用窗口显示DIFF
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR> "快捷键


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set NERDcommenter 快速多行注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> <leader>ci <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Persistent undo
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" automatically open the taglist window, when start Vim
let Tlist_Auto_Open = 1
"" close vim if the only window left open is taglist
let Tlist_Exit_OnlyWindow = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set laststatus=2
set ttimeoutlen=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vim-colors-solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark " 设置背景色,solarized有dark和light两种配色
let g:solarized_termcolors=256 " solarized主题设置在终端下的设置
colorscheme solarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%{fugitive#statusline()} "  show Git



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:jedi#goto_command            = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command    = "K"
let g:jedi#usages_command           = "<leader>n"
let g:jedi#completions_command      = "<C-Space>"
let g:jedi#rename_command           = "<leader>rname"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tabular_loaded = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set indentLine 缩进指示线
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" none X terminal
let g:indentLine_color_tty_light = 3  " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = '|' " Change Indent Char
let g:indentLine_enabled = 1  " enable by default



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark down file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
    let g:vim_markdown_folding_disabled=1
    let g:vim_markdown_no_default_key_mappings=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" create new file: insert file head
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""function SetTitle
func SetTitle()
 if &filetype == 'sh'
  call setline(1,"\#!/bin/bash")
  call append(line("."), "")
 elseif &filetype == 'python'
  call setline(1,"#!/usr/bin/env python")
  call append(line("."),"#_*_ coding:utf-8 _*_")
  call append(line(".")+1, "")
 elseif &filetype == 'ruby'
  call setline(1,"#!/usr/bin/env ruby")
  call append(line("."),"# encoding: utf-8")
  call append(line(".")+1, "")
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
 else
  call setline(1, "/*************************************************************************") 
  call append(line("."), " > File Name: ".expand("%"))
  call append(line(".")+1, " > Author: ")
  call append(line(".")+2, " > Mail: ")
  call append(line(".")+3, " > Created Time: ".strftime("%c"))
  call append(line(".")+4, " ************************************************************************/") 
  call append(line(".")+5, "")
 endif

 if expand("%:e") == 'cpp'
  call append(line(".")+6, "#include<iostream>")
  call append(line(".")+7, "using namespace std;")
  call append(line(".")+8, "")
 endif
 if &filetype == 'c'
  call append(line(".")+6, "#include<stdio.h>")
  call append(line(".")+7, "")
 endif
 if expand("%:e") == 'h'
  call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
  call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
  call append(line(".")+8, "#endif")
 endif

 if &filetype == 'java'
  call append(line(".")+6,"public class ".expand("%:r"))
  call append(line(".")+7,"")
 endif
"after creating new file, go to the end of the file
endfunc
autocmd BufNewFile * normal G



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F5 compile and run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
 exec "w"
 if &filetype == 'c'
  exec "!g++ % -o %<"
  exec "!time ./%<"
 elseif &filetype == 'cpp'
  exec "!g++ % -o %<"
  exec "!time ./%<"
 elseif &filetype == 'java'
  exec "!javac %"
  exec "!time java %<"
 elseif &filetype == 'sh'
  exec "!time bash %"
 elseif &filetype == 'python'
  exec "!time python %"
 elseif &filetype == 'html'
  exec "!firefox % &"
 elseif &filetype == 'go'
"        exec "!go build %<"
  exec "!time go run %"
"    elseif &filetype == 'mkd'
"        exec "!~/.vim/markdown.pl % > %.html &"
"        exec "!firefox %.html &"
 endif
endfunc
