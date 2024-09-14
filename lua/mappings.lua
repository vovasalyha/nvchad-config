require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "kl", "<ESC>")
-- map("i", "lk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<C-j>", "<Left>", { desc = "move left" })
map("i", "<C-;>", "<Right>", { desc = "move right" })
map("i", "<C-k>", "<Down>", { desc = "move down" })
map("i", "<C-l>", "<Up>", { desc = "move up" })

-- Movement remapping for operation pending mode
map("o", "j", "h", { noremap = true, silent = true })
map("o", "k", "j", { noremap = true, silent = true })
map("o", "l", "k", { noremap = true, silent = true })
map("o", ";", "l", { noremap = true, silent = true })

map({ "n", "v" }, "j", "<Left>", { desc = "move left" })
map({ "n", "v" }, ";", "<Right>", { desc = "move right" })
map({ "n", "v" }, "k", "<Down>", { desc = "move down" })
map({ "n", "v" }, "l", "<Up>", { desc = "move up" })

map("n", "<C-j>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-;>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-k>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-l>", "<C-w>k", { desc = "switch window up" })

-- prevent 'd', 'dd', 'c', 'cc' from yanking into the unnamed register
map({ "n", "v", "o" }, "d", '"_d', { desc = "Delete without yanking" })
map({ "n", "v", "o" }, "c", '"_c', { desc = "Change without yanking" })
map("n", "dd", '"_dd', { desc = "Delete line without yanking" })
map("n", "cc", '"_cc', { desc = "Change line without yanking" })

-- Remap ',' for moving forward to the next occurrence
map("n", ",", ";", { desc = "Move forward to next occurrence" })

-- Remap 'm' for moving backward to the previous occurrence
map("n", "m", ",", { desc = "Move backward to previous occurrence" })

-- Move current line in normal mode
map("n", "<A-k>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-l>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected lines in visual mode
map("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "<A-l>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Map <A-f> to format the current buffer manually
map("n", "<A-f>", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format current buffer" })

require("nvim-treesitter.configs").setup {
  -- Ensure this is enabled
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-Up>", -- Option + Up to initialize selection
      node_incremental = "<M-Up>", -- Option + Up to expand selection
      node_decremental = "<M-Down>", -- Option + Down to shrink selection
    },
  },
}

-- Move half page down/up and center the cursor
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })

-- Telescope Mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in current buffer" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find symbols in current file" })
map("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols query=<CR>", { desc = "Find symbols in workspace" })

-- Toggle floating terminal + config
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = {
      width = 0.6,
      height = 0.6,
      border = "double",
      row = 0.2,
      col = 0.2,
    },
  }
end, { desc = "Toggle Floating Terminal" })
