require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Telescope
-- Unbind defaults
unmap("n", "<leader>fw")
unmap("n", "<leader>fh")
unmap("n", "<leader>fo")
unmap("n", "<leader>gt")

-- Bind custom
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { desc = "Treesitter symbols" })
map("n", "<leader>tz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in buffer" })

-- Gitsigns
map("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true, desc = "Show Git blame for current line" })

-- Whitespace manipulation
map('v', '<leader>sw', ":'<,'>StripWhitespace<CR>", { noremap = true, silent = true, desc = "Strip whitespace in visual selection" })

-- Window navigation
-- Normal mode
map('n', '<A-Left>', '<C-w>h', { desc = "Move to left window" })
map('n', '<A-Down>', '<C-w>j', { desc = "Move to bottom window" })
map('n', '<A-Up>', '<C-w>k', { desc = "Move to upper window" })
map('n', '<A-Right>', '<C-w>l', { desc = "Move to right window" })

-- Visual mode
map('v', '<A-Left>', '<C-w>h', { desc = "Move to left window" })
map('v', '<A-Down>', '<C-w>j', { desc = "Move to bottom window" })
map('v', '<A-Up>', '<C-w>k', { desc = "Move to upper window" })
map('v', '<A-Right>', '<C-w>l', { desc = "Move to right window" })

-- Terminal mode
map('t', '<A-Left>', '<C-\\><C-N><C-w>h', { desc = "Move to left window" })
map('t', '<A-Down>', '<C-\\><C-N><C-w>j', { desc = "Move to bottom window" })
map('t', '<A-Up>', '<C-\\><C-N><C-w>k', { desc = "Move to upper window" })
map('t', '<A-Right>', '<C-\\><C-N><C-w>l', { desc = "Move to right window" })

-- Jumps
map('n', '{', "<cmd>keepjumps normal! {<CR>")
map('n', '}', "<cmd>keepjumps normal! }<CR>")

