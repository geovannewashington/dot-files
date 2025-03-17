return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  opts = {
    ensure_installed = {
      "lua",
      "c",
      "python",
      "javascript",
      "typescript",
      "vimdoc",
      "vim",
      "regex",
      "terraform",
      "sql",
      "dockerfile",
      "toml",
      "json",
      "java",
      "groovy",
      "go",
      "gitignore",
      "graphql",
      "yaml",
      "make",
      "cmake",
      "markdown",
      "markdown_inline",
      "bash",
      "tsx",
      "css",
      "html",
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = true, disable = { "ruby" } },

    -- Add textobjects module
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to the next text object
        lookahead = true,
        keymaps = {
          -- Example: Use `ci"` to change inside quotes
          ['i"'] = "@function.inner",
          ['a"'] = "@function.outer",
          -- You can add more text objects here, such as brackets, parentheses, etc.
          ["i("] = "@parameter.inner",
          ["a("] = "@parameter.outer",
          ["i{"] = "@block.inner",
          ["a{"] = "@block.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true,        -- Whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer", -- Jump to the start of the next function
          [']"'] = "@string.outer", -- Jump to the start of the next string
        },
        goto_next_end = {
          ["]M"] = "@function.outer", -- Jump to the end of the next function
        },
        goto_previous_start = {
          ["[m"] = "@function.outer", -- Jump to the start of the previous function
          ['["'] = "@string.outer", -- Jump to the start of the previous string
        },
        goto_previous_end = {
          ["[M"] = "@function.outer", -- Jump to the end of the previous function
        },
      },
    },
  },
}
