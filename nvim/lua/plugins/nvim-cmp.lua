-- plugins/cmp.lua
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippets
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            elseif require("luasnip").expandable() then
                require("luasnip").expand()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),     -- Scroll up in documentation
        ["<C-f>"] = cmp.mapping.scroll_docs(4),      -- Scroll down in documentation
        ["<C-Space>"] = cmp.mapping.complete(),      -- Trigger completion
        ["<C-e>"] = cmp.mapping.abort(),             -- Abort completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "luasnip" }, -- Snippet completions
        { name = "buffer" }, -- Buffer completions
        { name = "path" }, -- Path completions
    }),
})
