vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.opt.autoindent =true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.number = true

require("core.plugins")
require("core.theme")
require("configs.nvim-treesitter")
-- require("configs.nvim-tree")
require("configs.bufferline")
require("configs.lualine")
require("configs.indent_blankline")
require("configs.symbols-outline")
require("configs.coc")
require("configs.keybindings")
require("configs.mason-lspconfig")
require("configs.telescope")
