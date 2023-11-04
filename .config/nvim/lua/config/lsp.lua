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

    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
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

    ---------------------------------
    -- Inserting all required servers
    table.unpack(required_servers)
}

-- LSP-specific configurations
local texlab_settings = {
    texlab = {
        chktex = {
            onEdit = true,
            onOpenAndSave = true,
        }
    }
}


local lspconfig = require("lspconfig")

-- Setup server with optional settings
local function setup_server(server, server_settings)
    lspconfig[server].setup {
        on_attach = on_attach,
        settings = server_settings or nil,
    }
end


-- Applying settings for all servers
for _, server in ipairs(servers) do
    if server == "texlab" then
        setup_server(server, texlab_settings)
    else
        setup_server(server)
    end
end

