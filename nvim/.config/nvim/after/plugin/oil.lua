-- SPDX-License-Identifier: MIT

-- Original code from oil.nvim
-- Source: https://github.com/stevearc/oil.nvim


require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})


vim.keymap.set("n", "-", function()
    vim.cmd("Oil")
end)

