" 用vim的设置取代vi的设置
" Use Vim settings, rather than Vi settings
set nocompatible

" ============= Encoding Config(编码设置) ==============
set encoding=utf-8              " Decide the encoding in vim (vim内部编码方式)
set fileencoding=utf-8          " The encoding that current file uses (当前文件的编码方式)
set termencoding=utf-8          " THe encoding that terminal uses (vim所在终端的编码方式)
" Define the sequence that vim detect the encoding of file
" Vim按照如下方式来逐一探测文件的编码方式
set fileencodings=utf-8,chinese

" ============= General Config (通用设置) ==============
set number                      " Display line number (显示行号) 
set backspace=indent,eol,start  " Allow backspace in insert mode (允许插入模式下使用退格键)
set history=1000                " Store 1000 cmdline history (设置1000条历史命令记录)
set showcmd                     " Show incomplete commands in status bar (在状态栏显示命令)
set showmode                    " Show current mode in status bar (在状态栏显示当前vim模式)
set showmatch                   " highlight the matche brackets (高亮显示匹配的括号)
set gcr=a:blinkon0              " Disable cursor blink (取消光标闪烁)
set visualbell                  " No sound (当有beep声时，用闪烁来代替)
set autoread                    " Reload files when changed outside (文件外部改变时自动读入)
set fileformat=unix             " The default file type is unix|linux|mac
set whichwrap+=b,s,<,>,[,]      " Allow backspace and right left arrows to across lines
                                " 允许退格键以及左右方向键可以跨行顺利使用
set hlsearch                    " Highlight while search (搜索时即高亮结果)
set incsearch                   " Display immediately when search (搜索即显示)
set ignorecase                  " Ignore case when search (搜索时忽略大小写)
set smartcase                   " Smart case (单词有大写字母时不忽略大小写)
set report=0                    " Tell which line has been changed (告知哪一行被修改)

" With this set, opening a new file when the current buffer has unsafed 
" changes cause files to be hidden instead of close
" 加载此选项时，当vim有未写入硬盘的缓冲内容而打开新文件时，该缓冲内容被
" 隐藏而不是被关闭
set hidden

" Turn on syntax highlighting
" 打开语义高亮
syntax on

" Change leader to a comma because the backslash is too far away
" That means \cs in NERDCommenter turn into ,cs
" 将\键改为,键，主要应用在NERDCommenter插件中 \cs ==> ,cs
let mapleader=","

" ============= Turn off Swap files(禁止生成临时文件) ==============
set noswapfile
set nobackup
set nowb

" ============= Persist undo(持久撤销恢复) ==============
silent !mkdir ~/.vim/vimundos> /dev/null 2>&1
set undodir=~/.vim/vimundos/
set undofile
set undolevels=1000             " Maximum times of undos (最大撤销次数)

" ================== Indentation(缩进) ======================
set autoindent                  " Automatically indent as previous line(与上一行缩进相同)
set smartindent                 " Smart indent for C(C语言的智能缩进, 发现{}时处理不同)

" Set the width of TAB as 4, expandtab means transfer TAB to spaces
" 设置TAB键的宽度为4，并自动将TAB键转化为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Detect file type automatically
" 自动识别文件类型
filetype plugin on
filetype indent on
filetype on

" Display trailing spaces and TABs visually
" 显式地展示末尾的空格和TAB
set list
set listchars=trail:.

" Don't wrap lines and wrap lines at convenient points
" 禁止自动折行，仅在方便的位置折行:^I!@*-+_;:/?"
set nowrap
set linebreak

" ================== Fold(自动折叠) ======================
" zm command fold the code (zm命令手动折叠缩进)
" zr command open the folded code (zr命令打开折叠的缩进)
" :help fold-indent (查看缩进折叠的帮助)
set foldmethod=indent       " Fold based on indent(根据缩进关系来确定折叠)
set foldnestmax=3           " Deepest fold is 3 levels(最深折叠三层)
set nofoldenable            " Don't fold by default(不按默认规则折叠)

" ================== Command completion(TAB键命令补全) ======================
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~ "Studff to ignore when tab completing
set wildignore+=*vim/vimundos*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================== Command completion(TAB键命令补全) ======================
set scrolloff=8             " Start scrolling when we have 8 lines from margin
set sidescrolloff=15        " 定义自动滚动边界
set sidescroll=1

" ================== Color Scheme(Vim配色) ======================
" Syntax enable is necessary for colorscheme, and itretains the current scheme.
" Syntax enable命令使系统能保持色彩设置，否则可能发生can not find color scheme
syntax enable
" All color vim files are stored in /usr/share/vim/vim73/colors
" One can find his favorite color scheme and place the vim file in it
" 将vim配色文件放于/usr/share/vim/vim73/colors 目录下
" for more color scheme for download, refer to (更多配色参考)
" http://vimcolorschemetest.googlecode.com/svn/html/index-html.html
colorscheme desert256

" Using Pathogen to maintain vim plugins(使用Pathogen以及git submodule维护vim插件)
execute pathogen#infect()
