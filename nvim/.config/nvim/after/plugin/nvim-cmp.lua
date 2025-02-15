-- SPDX-License-Identifier: MIT

-- Original code from nvim-cmp
-- Source: https://github.com/hrsh7th/nvim-cmp

-- Modifications:
-- Copyright (c) 2023, daniyl-x


local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },


    mapping = cmp.mapping.preset.insert({
        -- Scroll the docs
        ["<C-b>"] = cmp.mapping.scroll_docs( -4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- Switch in items
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- Use <CR>(Enter) to confirm selection
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Super-Tab mapping
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- If the completion menu is visible select next one
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }), -- i - insert mode; s - select mode
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),


    formatting = {
        -- Set order from left to right
        -- kind: single letter indicating the type of completion
        -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
        -- menu: extra text for the popup menu, displayed after "word" or "abbr"
        fields = { "abbr", "menu" },

        -- Customize the appearance of the completion menu
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },

    -- Set source precedence
    sources = cmp.config.sources({
        { name = "nvim_lsp" },    -- For nvim-lsp
        { name = "luasnip" },     -- For luasnip
        { name = "buffer" },      -- For buffer word completion
        { name = "path" },        -- For path completion
    })
})

