" My custom .vimrc

" TODO:
" - Fixes and Enhancements:
"   - When pressing <Esc> the cursor moves one to the left.
"   - When copying the cursor moves to the beginning of the selection.
"   - Add Tabs Navigation shortkeys
"   - Add (Alt + arrows) navigation shortkeys for movement and deletion 
"   - Replace Tabs on the left for the project path
"   - Enhanced HTML, CSS, LESS, SASS, JS and PHP support
" - Plugins:
"   - Linting
"   - Nerdtree + Git ???
"   - Multicursors
"   - Search and replace, current file and project (Far) 

" ==> Plugins Setup 
" ==> Additional functionality 

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'kien/ctrlp.vim' 
Plugin 'editorconfig/editorconfig-vim' 
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

" ==> Running commands
" ==> Setting up env, etc ...

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" Create parent directories 
autocmd BufWritePre * :silent !mkdir -p %:p:h

" ==> Color scheme
" ==> Configure how vim looks

colorscheme Monokai " Use Monokai theme ~/.vim/colors/Monokai.vim

" ==> Handling syntax
" ==> Use syntax highlighting

syntax on " Use syntax highlighting

" ==> Filetype
" ==> File configs 

filetype plugin indent on " Filetype indentation

" ==> Setting options
" ==> Make vim yours

set showmode " Always show mode
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
set mouse=a " Enable using the mouse if terminal emulator
set updatetime=100 " Reduces update time for gitgutter to show updates
set encoding=utf-8 " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file.
set nobackup " Prevent vim from creating backups
set noswapfile " Prevent vim from creating .sw files

" ==> Mappings
" ==> Custom shortcuts to save time

" Selection
" Ctrl + a = Toggle Select all
map <C-a> <Esc>ggVG<Enter>
imap <C-a> <Esc>ggVG<Enter> 

" File shortkeys
" Ctrl + n = Create a new file
" Ctrl + s = Save current file
" Ctrl + o = Use ctrlp Plugin
map <C-n> :tabnew ./filename.ext
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
map <C-t> :tabnew ./filename.ext
map <C-w> :close<Enter>
" TODO: map <C-ALT-Left> :tabprevious<Enter>
" TODO: map <C-ALT-Right> :tabnext<Enter>

" Find shortkeys
" Ctrl + f = Find in current document
map <C-f> /
imap <C-f> <Esc>/
vmap <C-f> <Esc>/

" Find and Replace shortkeys
" TODO: Plugin ???

" ==> Plugins Configuration
" ==> Integrate plugins properly

" Ctrlp configs
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>'] } " Open new files in tab
let g:ctrlp_match_current_file = 1 " List editing files too
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " Ignore from .gitignore

" Airline configs
let g:airline#extensions#tabline#enabled = 1 " Enhaced tabs
let g:airline#extensions#tabline#show_splits = 0 " Prevent from splits being shown
let g:airline#extensions#tabline#show_buffers = 0 " Remove buffers from tab list when tab is closed
let g:airline#extensions#tabline#show_tab_nr = 0 " Remove tab number from tab
let g:airline#extensions#tabline#left_sep = '' " Left space
let g:airline#extensions#tabline#left_alt_sep = '|' " Separator char
let g:airline#extensions#tabline#show_close_button = 0 " Do not show close button since no mouse is used
let g:airline#extensions#tabline#tab_min_count = 2 " Only show tabs when more than one file
let g:airline_theme = 'base16_grayscale' " Bar theme

" UltiSnips keys 
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEditSplit = "vertical"

" UltiSnips Workaround to use Enter (Sublime like)
let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
  call UltiSnips#ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction
inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
