-- Remaps
vim.g.mapleader = " "                           -- leader key


-- Mappings
vim.keymap.set("n", "<leader>q", function()     -- quit all w confirmation
    vim.cmd("confirm qall")
end)

