" Vim config file
" TODO: type instructions on how to get started.

" TODO Functionalities:
" AutoRenameTag HTML, JSX, TSX, XML
" Terminal, horizontal split
" LazyGit (Similar to GitLens for VSCode)

" Plug plugin manager: https://github.com/junegunn/vim-plug
" Refer to the docs for installation
call plug#begin()
	Plug 'tpope/vim-surround' " Surrounding ysw)
	Plug 'tpope/vim-commentary' " For Commenting gcc & gc
	Plug 'tpope/vim-fugitive' " Git file status
	Plug 'ap/vim-css-color' " CSS Color Preview
	Plug 'rafi/awesome-vim-colorschemes' " Colorscheme collection
	Plug 'neoclide/coc.nvim'  " Auto Completion
	Plug 'ryanoasis/vim-devicons' " Developer Icons
	Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
	Plug 'nvim-telescope/telescope.nvim' " Latest neovim list fuzzy finder
	Plug 'nvim-telescope/telescope-file-browser.nvim' " File browser fuzzy finder vscode style
	Plug 'romgrk/barbar.nvim' " Enhanced tabs
	Plug 'kyazdani42/nvim-tree.lua' " File explorer sidebar
	Plug 'editorconfig/editorconfig-vim' " Editorconfig
	Plug 'airblade/vim-gitgutter' " Git status lines
	Plug 'romainl/vim-cool' " Handle search highlight toggle
  Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'} " Terminal
	Plug 'vim-airline/vim-airline' " Status bar
call plug#end()

syntax enable
colorscheme molokayo
highlight MatchParen cterm=underline ctermbg=black ctermfg=none

set number
set relativenumber
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set mouse=a
set encoding=UTF-8
set completeopt-=preview 
set cursorline " Hightlight the current line
set ignorecase " Ignore case when searching
set smartcase " Switch to search case sensitive if capital is found

" AirlineVim plugin config 
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" coc-vim
" CocVim requires specific extenstions to be installed
" Refer to the docs and install like :CocInstall coc-python ...
" When using snippets use ctrl+j and ctrl+k to navigate placeholders
inoremap <silent><expr><CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr><Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Find files using Telescope command-line sugar.
nnoremap <C-p> :Telescope git_files<cr>

" Barbar, enhanced tabs configs and maps
" TODO nvimtree integration:
" https://github.com/romgrk/barbar.nvim#integration-with-filetree-plugins
highlight BufferInactive cterm=none ctermbg=none ctermfg=darkgrey
map <silent><C-h> :BufferPrevious<cr>
map <silent><C-l> :BufferNext<cr>

" Start nvim-tree
lua require'nvim-tree'.setup {}
map <silent><C-b> :NvimTreeToggle<cr>

" Terminal
" TODO set terminal to open on the sidebar (NvimTree)
" so the required can be running and controlled.
lua require'toggleterm'.setup {}
