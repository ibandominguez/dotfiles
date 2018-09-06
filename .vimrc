" My custom .vimrc

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

" Mappings

" Selection
" Ctrl + a = Toggle Select all
map <C-a> <Esc>ggVG<Enter>
imap <C-a> <Esc>ggVG<Enter> 

" File shortkeys
" Ctrl + n = Create a new file
" Ctrl + s = Save current file
" Ctrl + o = TODO: USE ctrlp Plugin
map <C-n> :tabnew name.ext
map <C-s> :update<Enter>

" Cut, Copy and Pase shortkeys
" Ctrl + x = Cut selection
" Ctrl + c = Copy selection
" Ctrl + p = Paste selection
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<Esc>"+p
nmap <C-v> p
imap <C-v> <Esc>"+pa

" Find and Replace shortkeys
" Ctrl + f = Find in current document
map <C-f> /
" ===> TODO search, replace

" Multiple cursors
" Ctrl + d = Select next ocurrence
" ===> TODO

" Undo, Redo Default shortkeys
" Ctrl + z = Undo 
" Ctrl + r = Redo
" ===> TODO

" Tabs shortkeys
" Ctrl + t = Open new tab
" Ctrl + w = Close current tab
" TODO Ctrl + Alt + Left = Navigate to previous tab
" TODO Ctrl + Alt + Right = Navigate to next tab
map <C-t> :tabnew<Enter>
map <C-w> :close<Enter>
map <C-ALT-Left> :tabprevious<Enter>
map <C-ALT-Right> :tabnext<Enter>

" Left indentation
" Shift + Tab = Indent left
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
