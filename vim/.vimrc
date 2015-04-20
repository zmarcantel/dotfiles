set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

"**********************************************************
" Look and feel
"**********************************************************
set cul
set cuc
set number

set t_Co=256
color zach

"**********************************************************
" Convenience aliases
"**********************************************************
:command W w
:command Q q

"***********************************************************
" Editing
"***********************************************************
set hlsearch
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

set paste

" global swap directory
if isdirectory('/home/zach/.vim/swapfiles')
	set directory=/home/zach/.vim/swapfiles//
endif

" allow <leader><number> window switching
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

au BufNewFile,BufRead *.less set filetype=less

"***********************************************************
" Language specific
"***********************************************************

" add doxygen support to all cpp and h files
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.cpp set filetype=cpp.doxygen
augroup END

" attempt to add headers to vim's path
if isdirectory('/home/zach/coffee/src/lib')
	"let &path.=".,src/include,src/lib,,"
	set path+=/home/zach/coffee/src/lib
endif

" set SConstruct and SConscript to python syntax
autocmd BufNew,BufRead SConstruct setf python
autocmd BufNew,BufRead SConscript setf python
autocmd BufNew,BufRead *.scons setf python

" spell check markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" c++ error output highlighting
au BufRead,BufNewFile *.cerr set filetype=myerror
au Syntax myerror source $HOME/.vim/syntax/cerr.vim

"***********************************************************
" Behavior
"***********************************************************
set visualbell
set t_vb=

set mouse=n

"***********************************************************
" Plugins
"***********************************************************
let g:NERDTreeDirArrows=1
autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleMe/cpp/ycm/.ycm_extra_conf.py"

let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.note'

let g:vim_markdown_folding_disabled=1


"***********************************************************
" Status Line
"***********************************************************

hi plain term=bold cterm=bold ctermfg=White ctermbg=235
hi green term=bold cterm=bold ctermfg=107 ctermbg=235 guifg=#799d6a
hi orange term=bold cterm=bold ctermfg=215 ctermbg=235 guifg=#ffb964

function! MyGitBranchStyle()
    let branch = GitBranch()
    if branch == ''
        let branchStyle = ''
    else
        let branchStyle = branch
    end
    return branchStyle
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

set laststatus=2
set statusline=%#plain#%f\ [col:\ %#green#%c%#plain#]\ [line:\ %#green#%l%#plain#/%#orange#%L%#plain#]\ [win:\ %#green#%2{WindowNumber()}%#plain#]\ [branch:\ %#orange#%{MyGitBranchStyle()}%#plain#]

