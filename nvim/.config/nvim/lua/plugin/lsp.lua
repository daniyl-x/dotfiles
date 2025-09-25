-- SPDX-License-Identifier: Apache-2.0

-- Original code from mason.nvim
-- Source: https://github.com/williamboman/mason.nvim

-- Original code from mason-lspconfig.nvim
-- Source: https://github.com/williamboman/mason-lspconfig.nvim

-- Modifications:
-- Copyright (c) 2023-2024, daniyl-x


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

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end


-- Servers to install automatically
local required_servers = {
    "awk_ls",       -- awk
    "clangd",       -- c/c++
    "lua_ls",       -- lua
    "pylsp",        -- python
}

require("mason-lspconfig").setup({
    ensure_installed = required_servers
})


-- Servers to configure
local servers = {
    -- Insert optional servers before required
    "texlab",       -- latex, tex
    "ts_ls",        -- typescript, javascript

    ---------------------------------
    -- Inserting all required servers
    table.unpack(required_servers)
}

-- Applying settings for all servers
for _, server in ipairs(servers) do
    -- Include server specific settings if any
    local module_name = string.format("plugin.ls_specific.%s", server)
    local status, specific_settings = pcall(require, module_name)
    specific_settings = status and specific_settings or nil

    vim.lsp.config(server, {
        on_attach = on_attach,
        settings = specific_settings,
    })
    vim.lsp.enable(server)
end

