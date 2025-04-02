return {
  "andweeb/presence.nvim",
  lazy = false, -- Load at startup
  config = function()
    require("presence").setup({
      -- Custom settings (optional)
      auto_update        = true,
      neovim_image_text  = "I'm not running Arch BTW.", -- Custom text under the Neovim logo
      main_image         = "neovim",                    -- Can be "neovim", "file", or "logo"
      client_id          = "793271441293967371",        -- Default is fine
      log_level          = nil,                         -- Can be "debug", "info", "warn", or "error"
      debounce_timeout   = 10,                          -- How often to update Discord (in seconds)
      enable_line_number = false,                       -- Show line number in Discord
      blacklist          = {},                          -- File types to ignore
      buttons            = true,                        -- Show buttons in Discord Rich Presence
      file_assets        = {},                          -- Custom icons per filetype
      show_time          = true,                        -- Show time spent in Neovim
    })
  end,
}
