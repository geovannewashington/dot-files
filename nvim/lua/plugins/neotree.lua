return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*", -- Consider pinning to a specific commit if issues persist
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
        { "\\", ":Neotree toggle right<CR>", desc = "Toggle NeoTree on the right", silent = true },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false, -- Prevent Neo-tree from staying open as the last window
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw = true,
                use_libuv_file_watcher = true,
                window = {
                    position = "right", -- Default position
                    width = 35, -- Fixed width in config
                    mappings = {
                        ["\\"] = "close_window",
                    },
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        vim.cmd("wincmd L")      -- Force to right
                        vim.api.nvim_win_set_width(args.winid, 35) -- Set width via API
                    end,
                },
            },
        })

        -- Toggle Neo-tree on the right (no width in command)
        vim.keymap.set(
            "n",
            "<leader>e",
            ":Neotree toggle right<CR>",
            { noremap = true, silent = true, desc = "Toggle Neo-tree on the right" }
        )
    end,
}
