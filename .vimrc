" My custom .vimrc

" Plugins Setup 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
call vundle#end()

" Color scheme

colorscheme Monokai " Use Monokai theme ~/.vim/colors/Monokai.vim

" Handling syntax

syntax on " Use syntax highlighting

" Filetype 

filetype plugin indent on " Filetype indentation

" Setting options

set number " Display numbers
set smartindent " Indent Enhacements
set tabstop=2 " Tab indenting to 2
set shiftwidth=2 " When indenting with '>'
set expandtab " Indenting on tab
set backspace=indent,eol,start " Familiar like backspace behaving
set clipboard=unnamedplus " Make sure vim uses the system keyboard
set ignorecase " Case insensitive search
set smartcase " Use case sensitive if any cap is used
set incsearch " show match as search proceeds
set hlsearch " search highlights

" Mappings

" Selection
" Ctrl + a = Toggle Select all
map <C-a> <Esc>ggVG<Enter>
imap <C-a> <Esc>ggVG<Enter> 

" File shortkeys
" Execute "stty -ixon -ixoff" 
" to free terminal reserved key combos
" Ctrl + n = Create a new file
" Ctrl + s = Save current file
" Ctrl + o = Use ctrlp Plugin
map <C-n> :tabnew name.ext
noremap <C-s> :w<Enter>
vnoremap <C-s> <Esc>:w<Enter>
inoremap <C-s> <Esc>:w<Enter>

" Cut, Copy and Pase shortkeys
" Ctrl + x = Cut selection
" Ctrl + c = Copy selection
" Ctrl + p = Paste selection
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<Esc>"+p
nmap <C-v> p
imap <C-v> <Esc>"+pa

" Left indentation
" Shift + Tab = Indent left
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Quit Vim
map <C-q> :qa!<Enter>

" Undo, Redo Default shortkeys
" Ctrl + z = Undo 
" Ctrl + r = Redo
map <C-z> u
imap <C-z> <Esc>ua
vmap <C-z> <Esc>uv
imap <C-r> <Esc><C-r>a
vmap <C-r> <Esc><C-r>v

" Tabs shortkeys
" Ctrl + t = Open new tab
" Ctrl + w = Close current tab
" Ctrl + Alt + Left = Navigate to previous tab
" Ctrl + Alt + Right = Navigate to next tab
map <C-t> :tabnew filename.ext
map <C-w> :close<Enter>
" TODO: map <C-ALT-Left> :tabprevious<Enter>
" TODO: map <C-ALT-Right> :tabnext<Enter>

" Find shortkeys
" Ctrl + f = Find in current document
map <C-f> /
imap <C-f> <Esc>/
vmap <C-f> <Esc>/

" Find and Replace shortkeys
" ===> TODO, Plugin ???

" Plugins Configuration

" Ctrlp configs
let g:ctrlp_map = '<C-o>' " Change ctrlp keys
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>'] } " Open new files in tab
let g:ctrlp_match_current_file = 1 " List editing files too
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " Ignore from .gitignore
