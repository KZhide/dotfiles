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
set hidden
let g:mapleader = ","

if &compatible
  set nocompatible
endif

let g:config_home = strlen($XDG_CONFIG_HOME) ? $XDG_CONFIG_HOME : '~/.config'
let g:cache_home = strlen($XDG_CACHE_HOME) ? $XDG_CACHE_HOME : '~/.cache'

function! s:source_rc(path, ...) abort " vimscript fileを読み込む
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand(g:config_home . '/nvim' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  let content = map(readfile(abspath), 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

au BufRead,BufNewFile,BufReadPre *.jade setf pug
au BufRead,BufNewFile,BufReadPre *.gsql setf gsql
au TermOpen * setlocal nonumber norelativenumber

let s:dein_dir = expand(g:cache_home . '/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call s:source_rc('/dein.rc.vim')

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
