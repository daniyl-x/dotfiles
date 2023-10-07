-- Define colorscheme
local colorscheme = 'everforest'
--local colorscheme = 'onedark'


-- Check if colorscheme installed
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end


-- Everforest settings
if colorscheme == 'everforest' then
    vim.opt.termguicolors = true            -- correct colors
    vim.opt.background = 'dark'             -- bg dark/light
end

