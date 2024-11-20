-- Define available colorschemes
local colorscheme = {
    "everforest",
    "catppuccin-frappe",
}

-- Choose and setup one
vim.cmd(string.format("colorscheme %s", colorscheme[2]))

