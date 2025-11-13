
vim.g.mapleader = " "
vim.g.mapllocaleader = " "

--- plugin settings ---

require("autoclose").setup {
   options = {
      disabled_filetypes = {  },
   },
}

--require("nvim-tree").setup()

require('Comment').setup()

vim.opt.termguicolors = true
require("bufferline").setup{}


