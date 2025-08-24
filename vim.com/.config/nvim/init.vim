""" general
:set number  " left aligns current line number
:set relativenumber

:set nowrap

:set ts=4 sw=4

let g:clipboard = 'wl-copy'


""" plugins
call plug#begin()

" List your plugins here
Plug 'sheerun/vim-polyglot'
Plug 'imsnif/kdl.vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'abecodes/tabout.nvim'
Plug 'Saghen/blink.cmp'
Plug 'm4xshen/autoclose.nvim'
Plug 'numToStr/Comment.nvim'
"Plug 'nvim-tree/nvim-tree.lua'


Plug 'rafamadriz/neon'
Plug 'sainnhe/sonokai'
Plug 'tanvirtin/monokai.nvim'

Plug 'xiyaowong/transparent.nvim'

call plug#end()


""" theme
colorscheme monokai


:source ~/.config/nvim/config.lua

