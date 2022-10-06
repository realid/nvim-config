vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}

vim.keymap.set("n", "<C-n>", ":BufferLineCycleNext<CR>", opt)
vim.keymap.set("n", "<C-p>", ":BufferLineCyclePrev<CR>", opt)
