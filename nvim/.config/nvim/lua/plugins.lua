-- SPDX-License-Identifier: Apache-2.0

-- Original code from lazy.nvim
-- Source: https://github.com/folke/lazy.nvim

-- Modifications:
-- Copyright (c) 2023-2024, daniyl-x


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none",
    lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


-- Sync packages after editing this file
vim.cmd([[
    augroup lazy_user_config
        autocmd!
        autocmd BufWritePost plugins.lua Lazy sync
    augroup end
]])


-- Setup lazy.nvim
require("lazy").setup({
    -- Insert plugins below
    -------------------------

    -- Treesitter syntax highlighting
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},

    -- LSP stuff
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- Auto-completion
    'hrsh7th/nvim-cmp',
    {'hrsh7th/cmp-nvim-lsp', dependencies = {'nvim-cmp'}},     -- built-in
    {'hrsh7th/cmp-buffer', dependencies = {'nvim-cmp'}},       -- buffer
    {'hrsh7th/cmp-path', dependencies = {'nvim-cmp'}},         -- path
    {'hrsh7th/cmp-cmdline', dependencies = {'nvim-cmp'}},      -- cmdline
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Colorscheme
    'sainnhe/everforest',                    -- Everforest
    {'catppuccin/nvim', name = 'catppuccin'},  -- Catppuccin

    -- Lualine
    {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},

    -- Gitsigns
    'lewis6991/gitsigns.nvim',

    -- Trouble warnings list
    {'folke/trouble.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},

    -- Nvim-Tree file explorer
    {'nvim-tree/nvim-tree.lua', dependencies = {'nvim-tree/nvim-web-devicons'}},

    -- Oil.nvim file explorer
    'stevearc/oil.nvim',

    -------------------------
})

