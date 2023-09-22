---- Global keymaps
local map = vim.api.nvim_set_keymap

-- Set Leader to Space
vim.g.mapleader = " "

-- Create new splits
map("n", "<C-t><C-j>", "<C-w>s", {desc = "Create a new split below"})
map("n", "<C-t><C-k>", "<C-w>s", {desc = "Create a new split below"})
map("n", "<C-t><C-l>", "<C-w>v", {desc = "Create a new split right"})
map("n", "<C-t><C-h>", "<C-w>v", {desc = "Create a new split right"})

-- Resize splits
map("n", "<Leader>s", ":resize -5<CR>", {desc = "Reduce split size horizontally", silent = true})
map("n", "<Leader>w", ":resize +5<CR>", {desc = "Increase split size horizontally", silent = true})
map("n", "<Leader>d", ":vertical resize -5<CR>", {desc = "Reduce split size vertically", silent = true})
map("n", "<Leader>a", ":vertical resize +5<CR>", {desc = "Increase split size vertically", silent = true })

-- Move by displayed lines, not by fisical lines
map("n", "k", "gk", {silent = true, desc = "Move up by displayed lines"})
map("n", "j", "gj", {silent = true, desc = "Move down by displayed lines"})
map("n", "0", "g0", {silent = true, desc = "Move to the beginning of the displayed line"})
map("n", "$", "g$", {silent = true, desc = "Move to the end of the displayed line"})

-- Diagnostics
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Go to prev diagnostic", noremap=true, silent=true })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to next diagnostic", noremap=true, silent=true })

-- LSP
map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename", noremap=true, silent=true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code actions", noremap=true, silent=true })
