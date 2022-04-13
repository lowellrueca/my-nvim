-- key mappings ----------------------------------------------------------------
local keymap = vim.api.nvim_set_keymap
local opt_default = { noremap = true}
local opt_silent = { noremap = true, silent = true }

-- basics
keymap('n', '<F2>', '<esc>:', opt_default)
keymap('n', '<F3>', '<esc>:e **/', opt_default)
keymap('n', '<F4>', '<esc>:q!<cr>', opt_silent)
keymap('n', '<F5>', '<esc>:%s/', opt_default)
keymap('n', '<F6>', '<esc>:vimgrep<space>/', opt_default)

-- basic navigation
keymap('n', 'j', 'gj', opt_silent)
keymap('n', 'k', 'gk', opt_silent)
keymap('n', '<a-h>', '0', opt_silent)
keymap('n', '<a-l>', '$', opt_silent)
keymap('n', '<a-j>', '<c-d>', opt_silent)
keymap('n', '<a-k>', '<c-u>', opt_silent)

-- buffer navigation
keymap('n', '<a-n>', ':bnext<cr>', opt_silent)
keymap('n', '<a-p>', ':bprevious<cr>', opt_silent)

-- pane resizing
keymap('n', '<s-up>', ':resize -2<cr>', opt_silent)
keymap('n', '<s-down>', ':resize +2<cr>', opt_silent)
keymap('n', '<s-left>', ':vertical resize -2<cr>', opt_silent)
keymap('n', '<s-right>', ':vertical resize +2<cr>', opt_silent)

-- rows
keymap('n', 'o', 'o<esc>0D', opt_silent)
keymap('n', 'O', 'O<esc>0D', opt_silent)
keymap('n', '<a-u>', '<Esc>:m .-2<cr>==', opt_silent)
keymap('n', '<a-d>', '<Esc>:m .+1<cr>==', opt_silent)

-- pop up menu
vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]]
vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
