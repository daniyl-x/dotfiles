-- Install Packer if it's not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload config if we modify plugins.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])


-- Plugins installation
return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Treesitter syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- LSP stuff
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('neovim/nvim-lspconfig')

    -- Auto-completion
    use {'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]]}
    use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}     -- built-in
    use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}       -- buffer
    use {'hrsh7th/cmp-path', after = 'nvim-cmp'}         -- path
    use {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'}      -- cmdline
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Colorscheme
    use 'sainnhe/everforest'                    -- Everforest
    use {'catppuccin/nvim', as = 'catppuccin'}  -- Catppuccin

    -- Lualine
    use {'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons'}}

    -- Gitsigns
    use('lewis6991/gitsigns.nvim')

    -- Trouble warnings list
    use {'folke/trouble.nvim', requires = {'nvim-tree/nvim-web-devicons'}}

    -- Nvim-Tree file explorer
    use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}}

    -- Oil.nvim file explorer
    use {'stevearc/oil.nvim'}

    -----------------------------------------------------------
    -- Automatically set up configuration after clonning packer
    if packer_bootstrap then
        require('packer').sync()
    end
end)

