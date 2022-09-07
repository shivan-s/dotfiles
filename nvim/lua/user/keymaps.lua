-- =======
-- Keymaps
-- =======

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Pane navigation | ctrl+h/j/k/l
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows | +arrows
keymap("n", "<CS-Up>", ":resize +2<CR>", opts)
keymap("n", "<CS-Down>", ":resize -2<CR>", opts)
keymap("n", "<CS-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<CS-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers | shift+l/h
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Fast enter | jk
keymap("i", "jk", "<ESC>", opts)

-- Visual --
keymap("v", "<", "<gv", opts)
-- Stay indent | >/<
keymap("v", ">", ">gv", opts)

-- Move text | alt+j/k
keymap("v", "<J>", ":m .+1<CR>==", opts)
keymap("v", "<K>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dp', opts)

-- Visual Block --
-- Move text | J/K/alt+j/k
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>.+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Navigation | ctrl+h/j/k/l
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<CR>", opts)

-- Format
keymap("n", "<leader><leader>f", "<cmd>Format<CR>", opts)

-- Toggleterm
-- keymap("n", "<C-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
-- keymap("n", "<C-p>", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)

-- Zen Mode
keymap("n", "<leader>zm", "<cmd>ZenMode<CR>", opts)

-- Neogen
keymap("n", "<leader>n", "<cmd>Neogen<CR>", opts)

-- MarkDown Preview
keymap("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", opts)

-- Tagbar
keymap("n", "<leader>t", ":TagbarToggle<CR>", opts)

--Re Source
keymap("n", "<leader>so", ":source $MYINIT<CR>", opts)

-- Daps
local gkeymap = vim.keymap.set
gkeymap("n", "<F5>", ":lua require'dap'.continue()<CR>")
gkeymap("n", "<F6>", ":lua require'dap'.step_over()<CR>")
gkeymap("n", "<F7>", ":lua require'dap'.step_into()<CR>")
gkeymap("n", "<F8>", ":lua require'dap'.step_out()<CR>")
gkeymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
gkeymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
gkeymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
gkeymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
gkeymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
