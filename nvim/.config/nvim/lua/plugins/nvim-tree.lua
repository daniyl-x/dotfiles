-- SPDX-License-Identifier: GPL-3.0-or-later

-- Original code from nvim-tree
-- Source: https://github.com/nvim-tree/nvim-tree.lua


-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true


require("nvim-tree").setup({
    view = {
        side = "right",
    }
})

