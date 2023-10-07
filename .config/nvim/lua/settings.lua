vim.opt.clipboard = "unnamedplus" 	-- use system clipboard
vim.opt.mouse = "a" 			    -- allow mouse


-- Completion
vim.opt.completeopt = {
    "menu", 	-- show completions in popup menu
    "menuone",	-- show menu even with single completion
    "noselect"	-- don't select options automatically
}


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

