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
        -- 提供额外的图标
        use {'nvim-tree/nvim-web-devicons'}
        -- 符号列表
        use {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig'}
        use {'simrat39/symbols-outline.nvim'}
        -- 缩进线
        use {'lukas-reineke/indent-blankline.nvim'}
        -- 语法高亮
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        -- 主题
        use {'morhetz/gruvbox'}
        -- 底栏
        use {'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons', opt = true}}
        -- 侧边栏
        use {'kyazdani42/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}}
        use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
        -- 语法补全
        use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
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
