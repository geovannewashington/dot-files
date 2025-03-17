-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- leader ls (live-server) opens the live-serve pluging
-- vim.keymap.set("n", "<leader>ls", ":!live-server &<cr>", { desc = "start live server" })

vim.g.ultisnipsexpandtrigger = "<tab>"

-- disable the spacebar key's default behavior in normal and visual modes
vim.keymap.set({ "n", "v" }, "<space>", "<nop>", { silent = true })

-- for conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<c-s>", "<cmd> w <cr>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <cr>", opts)

-- quit file
vim.keymap.set("n", "<c-q>", "<cmd> q <cr>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- vertical scroll and center
vim.keymap.set("n", "<c-d>", "<c-d>zz", opts)
vim.keymap.set("n", "<c-u>", "<c-u>zz", opts)

-- find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "n", "nzzzv", opts)

-- resize with arrows
vim.keymap.set("n", "<up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<left>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<right>", ":vertical resize +2<cr>", opts)

-- buffers
vim.keymap.set("n", "<tab>", ":bnext<cr>", opts)
vim.keymap.set("n", "<s-tab>", ":bprevious<cr>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<cr>", opts)   -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <cr>", opts) -- new buffer

-- window management
vim.keymap.set("n", "<leader>v", "<c-w>v", opts)      -- split window vertically
vim.keymap.set("n", "<leader>h", "<c-w>s", opts)      -- split window horizontally
vim.keymap.set("n", "<leader>se", "<c-w>=", opts)     -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<cr>", opts) -- close current split window

-- navigate between splits
vim.keymap.set("n", "<c-k>", ":wincmd k<cr>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>", opts)
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>", opts)

-- tabs
-- potential conflict with tmux vim.keymap.set("n", "<c-t>", ":tabnew<cr>", opts)    -- open new tab
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", opts)   -- Close current buffer (tab)
vim.keymap.set("n", "<leader>tn", ":tabn<cr>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<cr>", opts) --  go to previous tab

-- toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<cr>", opts)

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- keep last yanked when pasting
vim.keymap.set("v", "p", '"_dp', opts)

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostics list" })
