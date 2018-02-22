" Editor Settings
set number
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
filetype plugin indent on
set colorcolumn=80
set mouse=a
let g:mapleader = ","

if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:config_home = $XDG_CONFIG_HOME

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let s:toml = g:config_home . '/nvim/dein/dein.toml'
let s:ft_toml = g:config_home . '/nvim/dein/deinft.toml'
let s:lazy_toml = g:config_home . '/nvim/dein/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:ft_toml, {'lazy': 1})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

colorscheme zenburn

" keymap for dvoraker
noremap t j
noremap n k
noremap s l

noremap j s
noremap J S
noremap k n
noremap K N
noremap l t
noremap L T
noremap T J
" keymap of window splitting (the same with tmux)
nnoremap <Leader>- :<C-u>split<CR>
nnoremap <Leader>\| :<C-u>vsplit<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>t <C-w>j
nnoremap <Leader>n <C-w>k
nnoremap <Leader>s <C-w>l

scriptencoding utf-8
" 不可視文字の表示
set list
" tab: »-
" 行末の空白: ･
" ノーブレークスペース: ⍽
" 画面の右側に文字があるとき: »
" 画面の左側に文字があるとき: «
set listchars=tab:»-,trail:･,nbsp:⍽,extends:»,precedes:«
