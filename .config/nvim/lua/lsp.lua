-- Mason settings
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end


-- Servers to install automatically
local required_servers = {
    "lua_ls",       -- lua
    "pylsp",        -- python
    "clangd",       -- c/c++
}

require("mason-lspconfig").setup({
    ensure_installed = required_servers
})


-- Servers to configure
local servers = {
    -- Insert optional servers before required
    "texlab",       -- latex, tex
    "tsserver",     -- typescript, javascript

    ---------------------------------
    -- Inserting all required servers
    table.unpack(required_servers)
}

-- Server specific configurations
local specific_settings = {
    ["texlab"] = require("ls_specific.texlab"),
}

local lspconfig = require("lspconfig")

-- Applying settings for all servers
for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach,
        settings = specific_settings[server] or nil,
    }
end

