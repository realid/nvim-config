require("nvim-tree").setup {
    auto_close = ture,
    git = {
        enable = true
    }
}

vim.keymap.set("n", "<C-m>", ":NvimTreeToggle<CR>", opt)
