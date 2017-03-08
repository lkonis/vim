" make sure we are loading from correct path (Lior)
" so change to vim root
cd $VIMRUNTIME


set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
filetype off



if &shell=~#'bash$'
   set shell=$COMSPEC " sets shell to correct path for cmd.exe
endif


" Pluggins 
" {{{
" set the runtime path to include Vundle and initialize
set rtp+=..\vimfiles\bundle\Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" call fzf (fuzzy find) plugin
" Plugin 'junegunn/fzf'


" calling the NERDtree plugin
Plugin 'scrooloose/nerdtree'

" vim-airline plugin
" Plugin 'bling/vim-airline'

" python mode
Bundle 'klen/python-mode'

" exuberant ctags
Bundle 'jakedouglas/exuberant-ctags'

" tagbar
"Plugin 'majutsushi/tagbar'

" buffer bar
" Bundle 'bling/vim-bufferline'
Bundle 'jeetsukumaran/vim-buffergator'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
"
" vim-color-solarized
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" variables 
" {{{
" leader definition
let mapleader = ','

" finding project path
let cwd=getcwd()
" ctags
let g:tagbar_ctags_bin = 'c:\ctags58\ctags.exe'

" }}}

" Mapping
" {{{
" Normal mode mapping
" map C-n shortcut to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" change to forward/back slashes
nnoremap <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap - /
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" find all in file
nnoremap <leader>fa :vimgrep // %<cr>:cope<cr>
" find all in all *.c/h files in newton
nnoremap <F8> :source c:\Vim\vimfiles\scripts\f8.vim<cr>:cope <cr>:cd -<cr>
nnoremap <leader>ffa :source c:\Vim\vimfiles\scripts\get_project.vim<cr>:cd `=project_path`<cr>:vimgrep // mod\*\src\* mod\*\inc\* app\*\* ..\..\bin\Debug\Firmware\inc_public\* <cr>:cope <cr>:cd -<cr>
" more generic search, that is search all over, starting one folder up
nnoremap <leader>ffj :source c:\Vim\vimfiles\scripts\get_project.vim<cr>:cd `=project_path`<cr>:vimgrep // **/.c **/*.h <cr>:cope <cr>:cd -<cr>

" run the build script
nnoremap <leader>bld :cd c:\Git\Newton_workspace\algo\<cr> :!build.cmd build_firmware<CR>
"nnoremap <F4> :e `=project_binfw_path`
" nnoremap <leader>bld :cd c:\Git\Newton_workspace\algo\firmware<cr> :!"c:\Program Files\Target Compiler Technologies\DSP4.5.3.1-11R1.16\chess_env.bat" && chessmk +P9 -s app\App_Audio\App_Audio.prx<CR>
" run the memory map post script
nnoremap <leader>map :cd c:\Git\Newton_workspace\algo\firmware\app\App_Audio\<cr> :! ..\\..\\..\\.build\\PostBuild.bat App_Virago Palpatine6.Wireless.TDI.1.0 App_Audio debug MapScan > maplog.txt<CR> :e maplog.txt<CR>
nnoremap dg :diffget<CR>
nnoremap dp :diffput<CR>
nnoremap <F9> [c<CR>
nnoremap <F10> ]c<CR>
nnoremap <leader>dd :diffthis<CR><ctrl>ww:diffthis<CR>
nnoremap <F5> :e!<CR>G
" generate tags file for Newton firmware
nnoremap <leader>ct :let cwd=getcwd()<cr>:cd `=project_path`<cr>:!c:\ctags58\ctags.exe --recurse=yes -L tag_file.txt -I clobbers<CR>:cd `=cwd`<cr>
nnoremap <leader>cd :cd %:p:h<cr>

nnoremap <leader>cct :let cwd=getcwd()<cr>:cd `=project_path`<cr>:!c:\ctags58\ctags.exe -I clobbers --recurse=yes  <CR>:cd `=cwd`<cr>

" Folding
nnoremap <Space> za
" shortcut for jumping to tag
source c:\Vim\vimfiles\scripts\get_project.vim
nnoremap <F12> :source c:\Vim\vimfiles\scripts\get_project.vim<cr>:cd `=project_path`<cr>:stjump <C-r><C-w><CR>
nnoremap <F7> :source c:\Vim\vimfiles\scripts\get_project.vim<cr>:cd `=project_path`<cr>:e app\app_audio\App_audio.prx<cr>:cd app\app_audio<cr>:make<cr><ctrl-o>

" visual mode mapping
vnoremap // mmo<esc>O/*<esc>`mo*/<esc>
vnoremap { mmo<esc>O{<esc>`mo}<esc>
vnoremap <F6> y:let @/=@"<cr>n
vnoremap 8 meol<ESC>Bi(<ESC>`eEa)<ESC>
vnoremap <Space> za


" insert mode mapping
inoremap <C-L> L. Konis
inoremap <Tab> <C-x><C-p>
inoremap <esc> <esc>:echoerr "!!!!!!! USE jk INSTEAD !!!!!!!"<cr>a
inoremap jk <esc>





" }}}

" AUTOCMD 
" {{{
autocmd!
" Remove ALL autocommands for the current group.
" set the syntax of Target project files (prx) to xml for syntax highlighting
autocmd BufNewFile,BufRead *.prx set filetype=xml
" allow put fold markers within vim scripts
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType matlab setlocal foldmethod=indent
autocmd FileType xml setlocal foldmethod=indent

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | else | :cd %:h | endif
" compiler settings
" Setup default settings based on file type
autocmd BufRead,BufNewFile *.prx compiler c5f16

" }}}

" SETTINGS 
" {{{
" handle ctags
" ctags optimization
"set autochdir
set tags=tags,./tags

" syntax
syntax enable
set background=dark
colorscheme torte " solarized
set guifont=Lucida_Console:h11:cANSI

" Folding rules 
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
"set foldmethod=marker          " detect triple-{ style fold markers
"set foldmethod=indent          " set fold method to indent
set foldmethod=syntax           " set fold method to syntax
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
" change back to current opened file's path
cd %:p:h

" Macros
let @q = ':%s/^#.*\n//g:%s/[^0-9;]//g:%s/^\s*\n//g:%s/^/[/g:%s/$\n/],/gIB=[$C];'
let @n = '/\<debug_micGNjVGdNkVggd:%s/Symbol debug_mic/d_mic/g:%s/:/=[/g:%s/$/];/gggVG€ý2€ý4'
" settings
:set ic
:set nu
:set hlsearch
:set incsearch
:set cindent
:set shiftwidth=4

"window setting
set lines=50 columns=120

set noautochdir
"}}}

" ABBREVIATIONS 
" {{{
:iabbrev LIor Lior
:iabbrev adn and
:iabbrev tehn then
:iabbrev waht what
"}}}

" writing and using and testing scripts
" toggle syntax
function! ToggleSyntax()
    if exists("g:syntax_on")
	syntax off
    else
	syntax enable
    endif
endfunction
nnoremap <silent> ;s :call ToggleSyntax()<cr>

" capitalize and center - e.g. use builtin vim commands
function! CapitalizeCenterAndMoveDown()
    s/\<./\u&/g "Built-in substitution capitalize each word
    center      "Built-in center command centers entire line
    +1          "Built-in relative motion (+1 line down)
endfunction
nnoremap <silent> \C :call CapitalizeCenterAndMoveDown()<cr>


iabbrev <silent> CWD <C-R>=getcwd()<CR>
