-- Define colorscheme
--local colorscheme = 'everforest'
local colorscheme = 'catppuccin-frappe'
--local colorscheme = 'rose-pine-moon'


-- Check if colorscheme installed
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end

