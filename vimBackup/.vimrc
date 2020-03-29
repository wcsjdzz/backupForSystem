"	
"	 ____                  _              ____       _   _   _                 
"	|  _ \ ___  __ _ _   _| | __ _ _ __  / ___|  ___| |_| |_(_)_ __   __ _ ___ 
"	| |_) / _ \/ _` | | | | |/ _` | '__| \___ \ / _ \ __| __| | '_ \ / _` / __|
"	|  _ <  __/ (_| | |_| | | (_| | |     ___) |  __/ |_| |_| | | | | (_| \__ \
"	|_| \_\___|\__, |\__,_|_|\__,_|_|    |____/ \___|\__|\__|_|_| |_|\__, |___/
"	           |___/                                                 |___/     
"	

set nu "show line number
set hlsearch "show searching result with highlight
set autoindent  "automatic indent
set incsearch
set backspace=2 "enable backspace to delete character
set ruler "show location of cursor
" let mapleader=";" "define <leader> key
" autocmd BufWritePost $MYVIMRC source $MYVIMRC " let changes take effect immediately
set wildmenu " smart completion of VIM cmd line 
set history=200 " set register size

" map <C-n> and <C-p> in cmd line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" map '%%' as directory of file in current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"set regular expression
set magic
" set very magic option
nnoremap / /\v

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

" TAB ==> SPACE
set expandtab
" Set the number of spaces that tabs occupy when editing
set tabstop=4
" Set the number of spaces that tabs occupy when formatting
set shiftwidth=4
" Treat consecutive numbers of spaces as a tab
set softtabstop=4

" disable menu
set guioptions-=m
set guioptions-=T

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止光标闪烁
set gcr=a:block-blinkon0
" code folding based on indent or syntax
" set foldmethod=indent
set foldmethod=syntax
" disable fold function when opening vim
set nofoldenable

set spell "setting of checking the spelling
set showmatch "set of bracket match
set showmode "status of the bottom left column
set showcmd "display incomplete commands
set cursorline "highlight current line
set cursorcolumn "highlight current column
set guifont=YaHei\ Consolas\ Hybrid\ 11.5 "set font
set completeopt=longest,menu
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "setting the encoding terms
set termencoding=utf-8
set encoding=utf-8

" statusline setting:
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" set searching path
set path+=/usr/include/*
set path+=/usr/local/include/*
set path+=/usr/lib/gcc-lib/i386-Linux/2.95.2/include/*
set path+=/usr/include/c++/7/
set path+=/usr/include/c++/7.5.0/
set path+=/usr/include/c++/v1/

" set auto building
nmap <f5> :!rm -rf main<CR>:wa<CR>:copen<CR>:AsyncRun make<CR><CR>

"setting the auto-map-completion 
" inoremap [ []<ESC>i
" inoremap {} {}
" inoremap { {}<ESC>i<ENTER><ESC>O
" auto-completion setted
syntax on

" setting of ctags
set tags=./.tags;,.tags

"	
"	 _   _              _ _____              
"	| \ | | ___ _ __ __| |_   _| __ ___  ___ 
"	|  \| |/ _ \ '__/ _` | | || '__/ _ \/ _ \
"	| |\  |  __/ | | (_| | | || | |  __/  __/
"	|_| \_|\___|_|  \__,_| |_||_|  \___|\___|
"	                                         

" set <F2> as openning and closing NerdTree
map <f2> :NERDTreeToggle<cr>
" modify display icon of NerdTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" Window location of NerdTree
let g:NERDTreeWinPos='left'
" Window size
let g:NERDTreeSize=30
" showing line number in NerdTree
let g:NERDTreeShowLineNumbers=1
" don't show hidden file in NerdTree
let g:NERDTreeHidden=0

"	
"	__   __           ____                      _      _       __  __      
"	\ \ / /__  _   _ / ___|___  _ __ ___  _ __ | | ___| |_ ___|  \/  | ___ 
"	 \ V / _ \| | | | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \ |\/| |/ _ \
"	  | | (_) | |_| | |__| (_) | | | | | | |_) | |  __/ ||  __/ |  | |  __/
"	  |_|\___/ \__,_|\____\___/|_| |_| |_| .__/|_|\___|\__\___|_|  |_|\___|
"	                                     |_|                               

" close some uneccessary function:
" let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
" let g:ycm_key_invoke_completion = '<c-x>'
let g:ycm_clangd_binary_path = "/usr/local/bin/clangd"
" set completeopt=menu,menuone
" noremap <c-x> <NOP>

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
map gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

"	
"	  ____              _   _ _       _     _ _       _     _   
"	 / ___| _     _    | | | (_) __ _| |__ | (_) __ _| |__ | |_ 
"	| |   _| |_ _| |_  | |_| | |/ _` | '_ \| | |/ _` | '_ \| __|
"	| |__|_   _|_   _| |  _  | | (_| | | | | | | (_| | | | | |_ 
"	 \____||_|   |_|   |_| |_|_|\__, |_| |_|_|_|\__, |_| |_|\__|
"	                            |___/           |___/           
"	

" highlight template function:
let g:cpp_experimental_template_highlight=1
" highlight of class scope
let g:cpp_class_scope_highlight=1

"	
"	    _                         ____              
"	   / \   ___ _   _ _ __   ___|  _ \ _   _ _ __  
"	  / _ \ / __| | | | '_ \ / __| |_) | | | | '_ \ 
"	 / ___ \\__ \ |_| | | | | (__|  _ <| |_| | | | |
"	/_/   \_\___/\__, |_| |_|\___|_| \_\\__,_|_| |_|
"	             |___/                              
"	
" map <F7> as compile of c++ program
" noremap <F7> :AsyncRun g++ -Wall -Wextra "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENAME)" <cr>
noremap <F7> :AsyncRun g++ -Wall -Wextra "%:p" -o "%:t.out"
" noremap <F7> :AsyncRun g++ -Wall -Wextra "%" -o "%<" <cr>

"	
"	 __  __ _       _ ____         __ _____            _                
"	|  \/  (_)_ __ (_) __ ) _   _ / _| ____|_  ___ __ | | ___  _ __ ___ 
"	| |\/| | | '_ \| |  _ \| | | | |_|  _| \ \/ / '_ \| |/ _ \| '__/ _ \
"	| |  | | | | | | | |_) | |_| |  _| |___ >  <| |_) | | (_) | | |  __/
"	|_|  |_|_|_| |_|_|____/ \__,_|_| |_____/_/\_\ .__/|_|\___/|_|  \___|
"	                                            |_|                     
"	

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
let g:miniBufExplMaxSize=2 " max size of height is 2
" hot key of next buffer and previous buffer:
map <F1> :MBEbp<CR>
map <F3> :MBEbn<CR>

"	
"	    _    _     _____ 
"	   / \  | |   | ____|
"	  / _ \ | |   |  _|  
"	 / ___ \| |___| |___ 
"	/_/   \_\_____|_____|
"	                     
" dynamic grammer check;	                     NOT FINISHED!
set fenc= 
"	let g:ale_linters_explicit = 1
"	let g:ale_completion_delay = 500
"	let g:ale_echo_delay = 20
"	let g:ale_lint_delay = 500
"	let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"	let g:ale_lint_on_text_changed = 'normal' " check when text changed in normal mode;
"	let g:ale_lint_on_insert_leave = 1 " check when leaving insert mode;
"	let g:airline#extensions#ale#enabled = 1
"	
"	let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"	let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"	let g:ale_c_cppcheck_options = ''
"	let g:ale_cpp_cppcheck_options = ''
"	
"	let g:ale_sign_error = "\ue009\ue009"
"	hi! clear SpellBad
"	hi! clear SpellCap
"	hi! clear SpellRare
"	hi! SpellBad gui=undercurl guisp=red
"	hi! SpellCap gui=undercurl guisp=blue
"	hi! SpellRare gui=undercurl guisp=magenta

"异步语法检查
" ale-setting {{{
let g:ale_set_highlights = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'normal' " check when text changed in normal mode;
let g:ale_lint_on_insert_leave = 1 " check when leaving insert mode;
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用g++对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang++'],
\   'c': ['clang++'],
\   'python': ['pylint'],
\}
let g:ale_c_clang_options = '-Wall -O2 -std=c99'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
" }}}


"	 _                   _           _____ 
"	| |    ___  __ _  __| | ___ _ __|  ___|
"	| |   / _ \/ _` |/ _` |/ _ \ '__| |_   
"	| |__|  __/ (_| | (_| |  __/ |  |  _|  
"	|_____\___|\__,_|\__,_|\___|_|  |_|    
"	                                       

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
" noremap <c-x> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
" noremap <c-a>:LeaderfTag<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'solarized'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"	
"	       _                 _     _       _     _ _       _     _   
"	__   _(_)_ __ ___       | |__ (_) __ _| |__ | (_) __ _| |__ | |_ 
"	\ \ / / | '_ ` _ \ _____| '_ \| |/ _` | '_ \| | |/ _` | '_ \| __|
"	 \ V /| | | | | | |_____| | | | | (_| | | | | | | (_| | | | | |_ 
"	  \_/ |_|_| |_| |_|     |_| |_|_|\__, |_| |_|_|_|\__, |_| |_|\__|
"	                                 |___/           |___/           
syntax keyword cppSTLtype initializer_list

"	
"	 _           _            _                 _     _           
"	(_)_ __   __| | ___ _ __ | |_    __ _ _   _(_) __| | ___  ___ 
"	| | '_ \ / _` |/ _ \ '_ \| __|  / _` | | | | |/ _` |/ _ \/ __|
"	| | | | | (_| |  __/ | | | |_  | (_| | |_| | | (_| |  __/\__ \
"	|_|_| |_|\__,_|\___|_| |_|\__|  \__, |\__,_|_|\__,_|\___||___/
"	                                |___/                         
"	
" auto indent
let g:indent_guides_enable_on_vim_startup=1
" show guides from level 2 
let g:indent_guides_start_level=2
" width of guides
let g:indent_guides_guide_size=1
" enable and disable usging <leader>i
:nmap <Leader>i <Plug>IndentGuidesToggle

"   
"    _____           _                
"   |_   _|_ _  __ _| |__   __ _ _ __ 
"     | |/ _` |/ _` | '_ \ / _` | '__|
"     | | (_| | (_| | |_) | (_| | |   
"     |_|\__,_|\__, |_.__/ \__,_|_|   
"              |___/                  
"   
" window location of Tagbar is at left side
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>lit :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"	  ____      _                     _                         
"	 / ___|___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___ 
"	| |   / _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \
"	| |__| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/
"	 \____\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___|
"	                                                            

" colorschme ==> solarized
syntax enable
set background=dark
filetype plugin indent on "detect filetype and load corresponding plugin 
" colorscheme dracula
if(has("gui_running"))
    colorscheme solarized
endif"
" packadd! dracula
" let g:solarized_termcolors=256
" Plugin 'vim-scripts/khaki.vim' "screen color mode
" 设置 gvim 显示字体
set guifont=Monospace\ Bold\ 17

" colorscheme of Powerline:
let g:Powerline_colorscheme='solarized256'

"	
"	__     __               _ _      
"	\ \   / /   _ _ __   __| | | ___ 
"	 \ \ / / | | | '_ \ / _` | |/ _ \
"	  \ V /| |_| | | | | (_| | |  __/
"	   \_/  \__,_|_| |_|\__,_|_|\___|
"	                                 

" Required for these 2 line2:
set nocompatible               
filetype off                  
 
" Set runtime path:
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/dracula/autoload/dracula.vim

" Initialize vundle:
call vundle#begin()

" This line is always at begining!:
Plugin 'gmarik/Vundle.vim'

" surround.vim
Plugin 'tpope/vim-surround'
" Plugin 'fugitive' allows us to do Git operations in vim editor
Plugin 'tpope/vim-fugitive'

" nerdtree Plugin: show files as TREE structure at left side
Plugin 'scrooloose/nerdtree'

" Plugin 'emmet' is helpful when writing HTML file
Plugin 'mattn/emmet-vim' 

" vim plugin YCM for auto complete
Plugin 'ycm-core/YouCompleteMe'

" Plugin 'vim-cpp-enhanced-highlight' provides better support for c++11/14/17:
Plugin 'octol/vim-cpp-enhanced-highlight'

" Plugin 'AsyncRun' enables complile and run in current window
Plugin 'skywind3000/asyncrun.vim'

" Plugin 'dracula' is a nice colorscheme:
Plugin 'dracula/vim', { 'name': 'dracula' }

" Plugin 'minibufexpl.vim' shows buffer of opened file
Plugin 'fholgado/minibufexpl.vim'

" Plugin 'Lokaltog/vim-powerline' beautifies power-line to solarized style
" Plugin 'powerline/powerline'
 Plugin 'itchyny/lightline.vim'

" Plugin 'ALE' supports dynamic grammer check
Plugin 'dense-analysis/ale'

" Plugin 'LeaderF' shows function list and supports quick file switching:
Plugin 'Yggdroot/LeaderF'

" Plugin 'Auto-pairs' supports auto backet-wraped
Plugin 'jiangmiao/auto-pairs'

" Plugin 'vim-indent-guides' shows visual indent
Plugin 'nathanaelkane/vim-indent-guides'


" Plugin 'tagbar' gives data structure based on semantic
Plugin 'majutsushi/tagbar'

" ALL PUGIN SHOULD BE WRITTEN BEFORE THIS LINE!!!

" End of Vundle, this line is neccessary!!!
call vundle#end()            

" Restore previous settings of filetype:
filetype plugin indent on
