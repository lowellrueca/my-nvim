local wk = require("which-key")

vim.cmd[[let mapleader = " "]]

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "", 
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
    -- basics
    ["<leader>q"] = { "<cmd>q<cr>", "quit"},
    ["<leader>w"] = { "<cmd>w<cr>", "write"},
    ["<leader>s"] = { "<cmd>sp<cr>", "horizontal split"},
    ["<leader>v"] = { "<cmd>vs<cr>", "vertical split"},
    ["<leader>x"] = { "<cmd>bdelete<cr>", "delete buffer"},

    -- word casing
    ["<leader>j"] = {name = "+to lower"},
    ["<leader>jw"] = { "guw", "to lower word"},
    ["<leader>ja"] = { "guaw", "to lower all word"},
    ["<leader>ju"] = { "guu", "to lower all words in row"},
    ["<leader>k"] = {name = "+to upper"},
    ["<leader>kw"] = { "gUw", "to upper word"},
    ["<leader>ka"] = { "gUaw", "to upper all word"},
    ["<leader>ku"] = { "gUU", "to upper all words in row"},

    -- helpers, toggle
    ["<leader>\\"] = {name = "+toggle"},
    ["<leader>\\l"] = { "<cmd>set list!<cr>", "toggle list"},
    ["<leader>\\n"] = { "<cmd>set nu!<cr>", "toggle number"},
    ["<leader>\\r"] = { "<cmd>set rnu!<cr>", "toggle relative number"},
    ["<leader>\\c"] = { "<cmd>set cursorcolumn!<cr>", "toggle cursorcolumn"},
    ["<leader>\\w"] = { "<cmd>execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<cr>", "toggle wrap line"},

    -- pane navigation
    ["<c-k>"] = {name = "+shift pane"},
    ["<c-k>h"] = {"<c-w>h", "shift pane left"},
    ["<c-k>j"] = {"<c-w>j", "shift pane down"},
    ["<c-k>k"] = {"<c-w>k", "shift pane up"},
    ["<c-k>l"] = {"<c-w>l", "shift pane right"},

    -- telescope
    ["<leader>f"] = {name = "+fuzzy"},
    ["<leader>ff"] = {"<cmd>Telescope find_files<cr>", "find files"},
    ["<leader>fg"] = {"<cmd>Telescope live_grep<cr>", "live grep"},
    ["<leader>fb"] = {"<cmd>Telescope buffers<cr>", "buffers"},
    ["<leader>fh"] = {"<cmd>Telescope help_tags<cr>", "help tags"},

    -- nvim-lspconfig-config
    ["<leader>l"] = {name = "+lsp"},
    ["<leader>ll"] = {"<cmd>lua vim.diagnostic.setloclist()<cr>", "set loclist"},
    ["<leader>lo"] = {"<cmd>lua vim.diagnostic.open_float()<cr>", "open float"},
    ["<leader>lp"] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "go to previous diagnostic"},
    ["<leader>ln"] = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "go to next diagnostic"},
    ["<leader>ld"] = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "go to declaration"},
    ["<leader>lD"] = {"<cmd>lua vim.lsp.buf.definition()<cr>", "go to definition"},
    ["<leader>li"] = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "go to implementation"},
    ["<leader>lr"] = {"<cmd>lua vim.lsp.buf.references()<cr>", "go to references"},
    ["<leader>lc"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "code action"},
    ["<leader>lf"] = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "formatting"},
    ["<leader>ls"] = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature help"},
    ["<leader>lk"] = {"<cmd>lua vim.lsp.buf.hover()<cr>", "hover"},
    ["<leader>lt"] = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "type definition"},
    ["<leader>lR"] = {"<cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
    ["<leader>lw"] = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "list work space folder"},
    ["<leader>la"] = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "add work space folder"},
    ["<leader>lx"] = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "remove work space folder"},

    -- nvim-tree
    ["<leader>e"] = { name = "+file tree"},
    ["<leader>et"] = { "<cmd>NvimTreeToggle<cr>", "tree toggle"},
    ["<leader>eT"] = { "<cmd>NvimTreeFindFileToggle<cr>", "find file toggle"},
    ["<leader>er"] = { "<cmd>NvimTreeRefresh<cr>", "tree refresh"},
    ["<leader>ef"] = { "<cmd>NvimTreeFindFile<cr>", "find file"},
    ["<leader>eo"] = { "<cmd>NvimTreeOpen<cr>", "tree open"},
    ["<leader>eq"] = { "<cmd>NvimTreeClose<cr>", "tree close"},
    ["<leader>eg"] = { "<cmd>NvimTreeFocus<cr>", "tree focus"},
    ["<leader>eR"] = { "<cmd>NvimTreeResize<cr>", "tree resize"},
    ["<leader>ec"] = { "<cmd>NvimTreeCollapse<cr>", "tree collapse"},
    ["<leader>eC"] = { "<cmd>NvimTreeCollapseKeepBuffers<cr>", "tree collapse keep buffers"},

    -- git
    ["<leader>h"] = { name = "+git"},
    ["<leader>hp"] = { "<cmd>Gitsigns prev_hunk<cr>", "previous hunk"},
    ["<leader>hn"] = { "<cmd>Gitsigns next_hunk<cr>", "next hunk"},
    ["<leader>ho"] = { "<cmd>Gitsigns preview_hunk<cr>", "preview hunk"},
    ["<leader>hl"] = { "<cmd>Gitsigns setloclist<cr>", "setloclist"},
    ["<leader>hh"] = { "<cmd>Gitsigns select_hunk<cr>", "select hunk"},
    ["<leader>hf"] = { "<cmd>Gitsigns diffthis<cr>", "diffthis"},
    ["<leader>hs"] = { "<cmd>Gitsigns stage_hunk<cr>", "stage hunk"},
    ["<leader>hu"] = { "<cmd>Gitsigns undo_stage_hunk<cr>", "undo stage hunk"},
    ["<leader>hg"] = { "<cmd>Gitsigns get_hunks<cr>", "get hunks"},
    ["<leader>hr"] = { "<cmd>Gitsigns reset_hunk<cr>", "reset hunk"},
    ["<leader>hb"] = { "<cmd>Gitsigns stage buffer<cr>", "stage buffer"},
    ["<leader>hB"] = { "<cmd>Gitsigns reset_buffer<cr>", "reset buffer"},
    ["<leader>hd"] = { "<cmd>Gitsigns toggle_deleted<cr>", "toggle deleted"},
    ["<leader>hw"] = { "<cmd>Gitsigns toggle_word_diff<cr>", "toggle word diff"},
    ["<leader>ht"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "toggle current line blame"},
    ["<leader>hx"] = { "<cmd>Gitsigns blame_line<cr>", "blame line"},
}

wk.register(mappings, opts)
