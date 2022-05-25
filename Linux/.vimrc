syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4
set cursorline " 커서라인 블록처리
set number      " 행 넘버 표시

" for yaml(ts = tab을 스페이스 몇개로 표시할지)
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
call vundle#end()

set t_Co=256

" for jellybeans
colorscheme jellybeans

" for indent guide
let g:indentLine_char = '⦙'
