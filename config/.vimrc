"
" VIMRC made by @nu-slab
"

" Environment {{{
let $XDG_CACHE_HOME  = empty($XDG_CACHE_HOME)  ? expand('$HOME/.cache')       : $XDG_CACHE_HOME
let $XDG_CONFIG_HOME = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config')      : $XDG_CONFIG_HOME
let $XDG_DATA_HOME   = empty($XDG_DATA_HOME)   ? expand('$HOME/.local/share') : $XDG_DATA_HOME
let $VIM_CACHE_HOME  = empty($VIM_CACHE_HOME)  ? $XDG_CACHE_HOME  . '/vim'    : empty($VIM_CACHE_HOME)
let $VIM_CONFIG_HOME = empty($VIM_CONFIG_HOME) ? $XDG_CONFIG_HOME . '/vim'    : empty($VIM_CONFIG_HOME)
let $VIM_DATA_HOME   = empty($VIM_DATA_HOME)   ? $XDG_DATA_HOME   . '/vim'    : empty($VIM_DATA_HOME)
let $VIM_PLUGIN_HOME = empty($VIM_PLUGIN_HOME) ? $VIM_CONFIG_HOME . '/plugins': empty($VIM_PLUGIN_HOME)
set runtimepath+=$VIM_CONFIG_HOME
set runtimepath+=$VIM_PLUGIN_HOME
set runtimepath+=$VIM_DATA_HOME
let s:backupdir_path=expand("$VIM_CACHE_HOME/backup")
let s:swapdir_path=expand("$VIM_CACHE_HOME/swap")
let s:undodir_path=expand("$VIM_CACHE_HOME/undodir")

if !isdirectory($VIM_CACHE_HOME)
    call mkdir($VIM_CACHE_HOME)
endif
if !isdirectory(s:backupdir_path)
    call mkdir(s:backupdir_path)
endif
if !isdirectory(s:swapdir_path)
    call mkdir(s:swapdir_path)
endif
if !isdirectory(s:undodir_path)
    call mkdir(s:undodir_path)
endif

" }}}

" Option {{{
" 文字コード関係
set fileencoding=utf-8
set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,default,latin
set fileformats=unix,dos,mac
" コマンドモードで補完を使用
set wildmode=longest:full,full
set wildmenu
set wildignorecase
" 折りたたみ
set foldmethod=marker
set foldlevel=1
set foldcolumn=0
" ビープ無効
set visualbell t_vb=
set vb t_vb=
set noerrorbells " エラーメッセージ表示時にビープを鳴らさない
if (705 <= v:version)
  set belloff=all
endif

set number " 行番号を表示
" set relativenumber " 行番号を相対値で表示
set cmdheight=1 " メッセージ表示欄を1行確保
set laststatus=2 " ステータス行を常に表示
set history=10000 " コマンドラインの履歴を10000件保存
set ambiwidth=single " double " 全角文字専用の設定
set tabstop=4 " TABの幅
set softtabstop=4 " キーボードから入力した場合のTABの幅
set shiftwidth=4 " 自動で挿入/削除されるインデントの量
set expandtab " TABをスペースにする
set nocompatible " Vi互換機能を無効
set hidden " 編集中でもファイルを開けるように
set autoread " 他で編集したファイルを自動で再読み込み
set completeopt=menuone,noselect " 補完時の挙動を指定
set scrolloff=5 " 垂直スクロール時，上下の余白行数
set sidescrolloff=10 " 水平スクロール時，左右の余白桁数
set sidescroll=1 " 水平スクロール時，移動桁数
set backspace=indent,eol,start " バックスペースの影響範囲
set whichwrap=b,s,h,l,<,>,[,],~ " 行頭・行末での移動許可
set nobackup " backup " バックアップを保存後も保持する，しない
set writebackup " nowritebackup " 保存前にバックアップを作成する，しない
let &backupdir=s:backupdir_path " バックアップディレクトリの指定
set backupext=.backup " バックアップファイルの拡張子
set swapfile " noswapfile " スワップファイルを作る・作らない
let &directory=s:swapdir_path " スワップファイルの保存先
set updatetime=30000 " 30秒ごとにスワップファイルを保存
set updatecount=500 " 500文字ごとにスワップファイルを保存
set undofile " noundofile " アンドゥファイルを生成する，しない
let &undodir=s:undodir_path " アンドゥファイルの保存先
set viminfo='1000,f1,<500,:300,@300,/100,!,h,c,n~/.cache/vim/viminfo " viminfoの設定
set showcmd " コマンドをステータスに表示
set noshowmode " 現在のモードを非表示矩形選択で文字のない箇所でも自由に移動
set modelines=5 " ファイル固有の設定を上下?行読み込み
set notitle " タイトルを変更させない
set clipboard=unnamed,unnamedplus,autoselect " ヤンクでクリップボードを使用
set virtualedit=block " 矩形選択で文字のない箇所でも自由に移動
set mouse=a " マウス全モードで有効化
set nowrap " 折り返さない
set ruler " ルーラーを表示
set display=lastline " 省略されずに表示
set list " 不可視文字を表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% " 不可視文字の設定
set shortmess+=I " 開始時の挨拶を表示しない
set shortmess+=s " 検索ループ時のメッセージを表示しない
set cursorline " カレント行のハイライト
set showmatch " 対応する括弧をハイライト表示する
set matchtime=3 " 括弧のハイライト表示の秒数を設定
set cinoptions+=:0 " インデント方法の変更
set lazyredraw " コマンド実行中は再描画しない
set ttyfast " 高速ターミナル接続を行う
set nofoldenable " 検索にマッチした行以外折りたたむ
set tags+=.tags,./.tags " タグファイルを指定
set showfulltag " 補完時に1行まるごと補完
set wildoptions=tagfile " タグから補完リストに追加
set wrapscan " 末尾まで検索後、ファイル先頭にループさせる
set ignorecase " 検索で大文字小文字を区別しない
set smartcase " 検索文字に大文字があるときは大文字小文字を区別する
set incsearch " インクリメンタルサーチ
set hlsearch " 検索文字列をハイライト表示
set browsedir=buffer " 現在のディレクトリから開始
set shellslash " Windowsでパスの区切り文字をスラッシュで扱う
set nrformats= " すべての数を10進数として扱う
set guioptions-=T " ツールバーを非表示
set guioptions+=ambiwidth " yでコピーしたとき、クリップボードに入る
set guioptions-=m " メニューバーを非表示
" set guioptions+=R " 右スクロールバーを非表示
set t_Co=256 " 256 Colors
set guicursor+=c:ver10
" set spell " スペルチェック(コメントも適用されるので、指定しない)
set autoindent " cindent smartindent " オートインデント
set equalalways " noequalalways " ウィンドウ分割時，自動調整
" set conceallevel=0 " concealをOFF
let g:vim_json_syntax_conceal = 0 " vimでjsonを開いた時のconcealをOFF

syntax on " シンタックスハイライト
" }}}

" Function {{{
command! CopyPath let @*expand('%') | echo 'Copied path of edited file'
" }}}

" Autocommand {{{

" auto reload .vimrc
augroup source-vimrc
    autocmd!
    autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
    autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
    augroup redhat
        " In text files, always limit the width of text to 78 characters
        autocmd BufRead *.txt set tw=78
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                    \   exe "normal! g'\"" |
                    \ endif
    augroup END
endif

" .mdファイルをModula2形式ではなく、Markdown形式で開く。
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Transparent Background
augroup AutoColorscheme
  autocmd!
  autocmd Colorscheme * highlight Normal      ctermbg=none
  autocmd Colorscheme * highlight NonText     ctermbg=none
  autocmd Colorscheme * highlight LineNr      ctermbg=none
  autocmd Colorscheme * highlight Folded      ctermbg=none
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
augroup END
" augroup Colorcheme
"     autocmd Colorscheme * highlight Comment        term=NONE cterm=NONE gui=NONE
"     autocmd Colorscheme * highlight SpecialComment term=NONE cterm=NONE gui=NONE
" augroup END
" }}}

" Keybind {{{
" */#をsmartcaseに対応できるように置き換え
nmap * /<C-r><C-w><CR>N
nmap # ?<C-r><C-w><CR>N

" Ctrl + hjkl でウィンドウ間を移動
" My CTRL-H mapping doesn't work
" If you are running Neovim 0.1.7 or older, adjust your terminal's "kbs" terminfo entry:
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" Escを2回押してハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" TABにて対応ペアにジャンプ
nmap <Tab> %
vmap <Tab> %

"" コマンドラインモード
" 行頭に移動
cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>

" TABをスペースに変換
nnoremap <Leader>dt :<C-u>retab<CR>
" CRを削除
"nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//g<CR>
" TAB CR削除
nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//ge<CR>:noh<CR>:retab<CR>gg

"" タブ操作
nnoremap [tab] <Nop>
nmap t [tab]

" tn 新規タブ
map <silent> [tab]n :tabnew<CR>
" tl 次のタブ
map <silent> [tab]l :tabnext<CR>
" th 前のタブ
map <silent> [tab]h :tabprevious<CR>

" 検索で自動エスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" .vimrcや.gvimrcの変更を反映するためのKey-mappingを定義する
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
  nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

"" インサートモード
inoremap <C-b> <Up>
inoremap <C-f> <Down>
inoremap <C-p> <Left>
inoremap <C-n> <Right>
" }}}

" Plugin Manager {{{

" set background=dark
" colorscheme darkblue

let data_dir = has('nvim') ? stdpath('data') . '/site' : $VIM_DATA_HOME
let plug_file = data_dir . '/autoload/plug.vim'

" Install vim-plug if not found
if empty(glob(plug_file))
  silent execute '!curl -fLo ' . plug_file .
    \ ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
call plug#begin(data_dir . '/plugged')

  " Colorscheme
  Plug 'morhetz/gruvbox'
  Plug 'tomasr/molokai'
  Plug 'dracula/vim'
  Plug 'joshdick/onedark.vim'
  Plug 'folke/tokyonight.nvim'

  " status line
  Plug 'itchyny/lightline.vim'

  " filetype
  Plug 'lervag/vimtex', { 'for': ['tex'] }
  Plug 'vhda/verilog_systemverilog.vim'

  " Utilities
  Plug 'jiangmiao/auto-pairs'

  " for Vim
  if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

call plug#end()

" Check the specified plugin is installed
function s:is_plugged(name)
  if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
    return 1
  else
    return 0
  endif
endfunction


" Plugin configurtation
if s:is_plugged("gruvbox")
    set background=dark
    colorscheme gruvbox
endif
" }}}

" Local setting {{{

" Load local settings.
if filereadable(expand('$HOME/.vimrc_local'))
    set runtimepath+=$HOME
    runtime! $HOME/.vimrc_local
endif

" }}}

