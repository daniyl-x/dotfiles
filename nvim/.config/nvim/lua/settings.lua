-- vim.opt.clipboard = "unnamedplus" 	-- use system clipboard
vim.opt.mouse = "a" 			    -- allow mouse


-- Completion
vim.opt.completeopt = {
    "menu", 	-- show completions in popup menu
    "menuone",	-- show menu even with single completion
    "noselect"	-- don't select options automatically
}


-- Folding
vim.opt.foldmethod = "syntax"       -- fold code by syntax
vim.opt.foldlevel = 99              -- fold levels opened by default


-- Search
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.ignorecase = true           -- ignore case in searches
vim.opt.smartcase = true            -- uppercase sensetive


-- Tab / Indent
vim.opt.tabstop = 4			        -- visual spaces per TAB
vim.opt.softtabstop = 4			    -- idk why but tabs again
vim.opt.shiftwidth = 4			    -- insert 4 spaces on a TAB
vim.opt.expandtab = true		    -- tabs to spaces


-- UI
vim.opt.number = true			    -- show line numbers
vim.opt.relativenumber = true	    -- show relative line numbers
vim.opt.splitbelow = true		    -- open splits below
vim.opt.splitright = true		    -- open vsplits right
vim.opt.colorcolumn = "80"          -- vertical line on 80 column
vim.opt.cursorline = true           -- highlight current line
vim.opt.termguicolors = true        -- correct colors
vim.opt.linebreak = true            -- don't break words when wrapping lines
vim.opt.wrap = false                -- disable line wrapping


-- Ugly filetype specific options
vim.cmd([[autocmd FileType html setlocal shiftwidth=2 tabstop=2]])
vim.cmd([[autocmd FileType python setlocal foldmethod=indent]])

