return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "┆",
            -- Add this to avoid conflicting with colorcolumn
            highlight = { "Whitespace", "NonText" },
        },
        scope = {
            show_start = false,
            show_end = false,
            show_exact_scope = false,
        },
        exclude = {
            filetypes = {
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
            },
        },
        -- Add this to ensure the colorcolumn is visible
        whitespace = {
            highlight = { "Whitespace", "NonText" },
        },
    },
}
