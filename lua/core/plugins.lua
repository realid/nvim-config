local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
    function()
        use {'wbthomason/packer.nvim'}
        use {'neovim/nvim-lspconfig'}
        use {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'}
        -- nvim-cmp
        use {'hrsh7th/cmp-nvim-lsp'}
        use {'hrsh7th/cmp-buffer'}
        use {'hrsh7th/cmp-path'}
        use {'hrsh7th/cmp-cmdline'}
        use {'hrsh7th/nvim-cmp'}
        -- For vsnip users.
        use {'hrsh7th/cmp-vsnip'}
        use {'hrsh7th/vim-vsnip'}
        -- For luasnip users.
        use {'L3MON4D3/LuaSnip'}
        use {'saadparwaiz1/cmp_luasnip'}
        -- lspkind
        use {'onsails/lspkind-nvim'}

        use {'morhetz/gruvbox'}
        use {'lukas-reineke/indent-blankline.nvim'}
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, tag = 'nightly'}
        use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
        use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
       -- use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        max_jobs = 16,
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    }
})
