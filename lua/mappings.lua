require "nvchad.mappings"

local map = vim.keymap.set

-- ARVim
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Scroll
map("n", "<A-k>", "<C-Y>", { desc = "Scroll up one line" })
map("n", "<A-j>", "<C-E>", { desc = "Scroll down one line" })

-- Nvim Tmux Navigation
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Navigate Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Navigate Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Navigate Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Navigate Right" })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Tmux Navigate Previous" })

-- DAP
map("n", "<leader>dpr", function()
    require('dap-python').test_method()
  end, { desc = "Test Python DAP." })

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Toggle breakpoint" })
