""" general
:set number  " left aligns current line number
:set relativenumber

:set nowrap

:set ts=4 sw=4

let g:clipboard = 'wl-copy'

"leader key


""" plugins
call plug#begin()

" language server and languages
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'sheerun/vim-polyglot'
Plug 'imsnif/kdl.vim'

" qol
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'abecodes/tabout.nvim'
Plug 'Saghen/blink.cmp'
Plug 'm4xshen/autoclose.nvim'
Plug 'numToStr/Comment.nvim'
"Plug 'nvim-tree/nvim-tree.lua'

" gui
Plug 'nvim-tree/nvim-web-devicons' " icons with colours
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
"Plug 'folke/which-key.nvim'

" themes
Plug 'rafamadriz/neon'
Plug 'sainnhe/sonokai'
Plug 'tanvirtin/monokai.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Plug 'xiyaowong/transparent.nvim'

call plug#end()


""" theme
colorscheme catppuccin-mocha


:source ~/.config/nvim/config.lua

