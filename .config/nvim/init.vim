" This is my work in progress vim config file

" TODO: List keys of the plugins and extesions to have
" a quick reference.

" TODO: List system dependencies and installation guide or links
" Macos: brew install fd ripgrep fzf

" TODO Functionalities:
" Project search and replace
" Enhance snippets and create my own ones
" Share system clipboard

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
  Plug 'nvim-lua/plenary.nvim' " Telescope required dependency
	Plug 'nvim-telescope/telescope.nvim' " Latest neovim list fuzzy finder
	Plug 'nvim-telescope/telescope-file-browser.nvim' " File browser fuzzy finder vscode style
  Plug 'nvim-telescope/telescope-fzf-native.nvim' " Native fzf to improve performance
	Plug 'romgrk/barbar.nvim' " Enhanced tabs
	Plug 'kyazdani42/nvim-tree.lua' " File explorer sidebar
	Plug 'editorconfig/editorconfig-vim' " Editorconfig
	Plug 'airblade/vim-gitgutter' " Git status lines
	Plug 'romainl/vim-cool' " Handle search highlight toggle
	Plug 'vim-airline/vim-airline' " Status bar
  Plug 'kdheepak/lazygit.nvim' " :LazyGit GitLens VSCode like git
  Plug 'AndrewRadev/tagalong.vim' " AutoRenameTag HTML, JSX, XML
  Plug 'pangloss/vim-javascript' " Javascript extended support
  Plug 'leafgarland/typescript-vim' " Typescript extended support
  Plug 'peitalin/vim-jsx-typescript' " TSX, JSX support
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
set guicursor=n-v-c:block,i-ci-ve:ver30-blinkwait300-blinkon200-blinkoff150 " cursor insert mode blink
set clipboard=unnamed " Share clipboard

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
" TODO: Find a way to be able to go :Telescope resume
" that can differentiate between find_files and live_grep
map <C-p> :Telescope find_files<cr>
map <C-f> :Telescope live_grep<cr>

" Barbar, enhanced tabs configs and maps
" TODO nvimtree integration:
" https://github.com/romgrk/barbar.nvim#integration-with-filetree-plugins
highlight BufferInactive cterm=none ctermbg=none ctermfg=darkgrey
map <silent><C-h> :BufferPrevious<cr>
map <silent><C-l> :BufferNext<cr>

" Start nvim-tree
" keys list for quick documentation:
" a: add a file or directory when preprended by /
" d: delete the file or dir on the current cursor
" r: rename the file or dir on the current cursor
lua require'nvim-tree'.setup {}
map <silent><C-b> :NvimTreeToggle<cr>

" LazyGit config
map <silent><C-g> :LazyGit<cr>

" Javascript support
let g:javascript_plugin_jsdoc = 1

" Vim-jsx-typescript config
" JSX Support for all files js,jsx,tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
