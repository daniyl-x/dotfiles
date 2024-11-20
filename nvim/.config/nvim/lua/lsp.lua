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


local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end


-- Servers to install automatically
local required_servers = {
    "awk_ls",       -- awk
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

