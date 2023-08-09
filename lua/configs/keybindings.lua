local opt = {
    noremap = true,
    silent = true,
}

local map = vim.api.nvim_set_keymap

map("c", "<C-a>", ":CocCommand clangd.switchSourceHeader<CR>", opt)
map("n", "<C-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<C-,>", ":SymbolsOutline<CR>", opt)
