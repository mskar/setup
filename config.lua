-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- https://www.lunarvim.org/configuration/02-keybindings.html#lunarvim-keybindings
-- use the default vim behavior for H and L 
lvim.keys.insert_mode["<C-k>"] = nil
lvim.keys.normal_mode["<S-l>"] = nil
lvim.keys.normal_mode["<S-h>"] = nil
-- add your own keymapping
-- Emacs and bash style insert mode CTRL shortcuts
lvim.keys.normal_mode["ZA"] = ":xa<CR>"
lvim.keys.normal_mode["Y"] = "y$"
-- <C-a> = Move to start of the line; like in vim command mode: c_ctrl-b; To insert previously inserted text, use <C-r>. or <Alt-.> (below)
lvim.keys.insert_mode["<C-a>"] = "<Home>"
-- <C-b> = Move one character backward; the opposite of <C-f>
lvim.keys.insert_mode["<C-b>"] = "<Left>"
-- <C-d> = Delete one character forward; the opposite of <C-h>
vim.cmd [[inoremap <silent><expr> <C-d> "\<C-g>u<Delete>"]]
-- <C-e> = Move to end of the line (already exists in command mode: c_ctrl-e), this also cancels completion
lvim.keys.insert_mode["<C-e>"] = "<End>"
-- <C-f> = Move one character forward; the opposite of <C-b>; <C-f> is too useful (for : / ?) to remap
lvim.keys.insert_mode["<C-f>"] = "<Right>"
-- <C-g> = Cancel completion
vim.cmd [[inoremap <silent><expr> <C-g> pumvisible() ? "\<C-e>" :  "<C-g>"]]
-- <C-h> = Delete one character backward; the opposite of <C-d>; already exists in command mode: c_ctrl-h
vim.cmd [[inoremap <silent><expr> <C-h> "\<C-g>u<BS>"]]
-- <C-k> = Delete to end of line; the opposite of <C-u>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/; https://superuser.com/a/855997
vim.cmd [[inoremap <expr> <C-k> col(".") == col("$") ? "<Del>" : "<C-o>d$"]]
-- <C-r> = make paste from register undoable in insert mode; already exists in command mode: c_ctrl-r
vim.cmd [[inoremap <silent><expr> <C-r> "\<C-g>u<C-r>"]]
-- <C-u> = Delete to start of line; the opposite of <C-k>; already exists in command mode: c_ctrl-u
vim.cmd [[inoremap <silent><expr> <C-u> "\<C-g>u<C-u>"]]
-- <C-w> = Delete word backward; opposite of <A-d>; same as <A-h>; already exists in command mode: c_ctrl-w
vim.cmd [[inoremap <silent><expr> <C-w> "\<C-g>u<C-w>"]]
-- <C-y> = Paste from system clipboard (not from killring like in bash/emacs)
vim.cmd [[inoremap <silent> <C-y> <CR><C-r><C-o>"]]
-- <C-_> = Undo like in bash/emacs (this works really well)
lvim.keys.insert_mode["<C-_>"] = "<C-o>u"
-- <C-/> = Undo like in bash/emacs (this works really well)
lvim.keys.insert_mode["<C-/>"] = "<C-o>u"
-- <C-=> = Redo; opposite of <C-_>
lvim.keys.insert_mode["<C-=>"] = "<C-o><C-r>"
-- <A-a> = Move to previous sentence start ; opposite of <A-e>
lvim.keys.insert_mode["<A-a>"] = "<C-o>("
-- <A-b> = Move one word backward; opposite of <A-f>
lvim.keys.insert_mode["<A-b>"] = "<S-Left>"
-- <A-c> = Capitalize letter and move forward
vim.cmd [[inoremap <expr> <A-c> getline('.')[col('.')-1] =~ "\\s" ? "<C-o>W<C-o>gUl<C-o>l<C-o>guw<Esc>ea" : "<C-o>gUl<C-o>l<C-o>guw<Esc>ea"]]
-- <A-d> = Delete word forward; opposite of <A-h> and <C-w>; https://www.reddit.com/r/vim/comments/9i58q8/question_re_delete_word_forward_in_insert_mode/e6he226/
vim.cmd [[inoremap <expr> <A-d> col(".") == col("$") ? "<Del>" : "<C-o>de"]]
-- <A-e> = Move to previous sentence start ; opposite of <A-a>
lvim.keys.insert_mode["<A-e>"] = "<C-o>)"
-- <A-f> = Move one word forward; opposite of <A-b>
lvim.keys.insert_mode["<A-f>"] = "<S-Right>"
-- <A-l> = Lowercase to word end; opposite of <A-u>
lvim.keys.insert_mode["<A-l>"] = "<C-o>gue<Esc>ea"
-- <A-u> = Uppercase to word end; opposite of <A-l>
lvim.keys.insert_mode["<A-u>"] = "<C-o>gUe<Esc>ea"
-- <A-.> = Insert Previously Inserted text (if any)
lvim.keys.insert_mode["<A-.>"] = "<C-r>."
-- 2-character Sneak (default)
lvim.keys.normal_mode["<A-s>"] = "<Plug>Sneak_s"
lvim.keys.normal_mode["<A-S>"] = "<Plug>Sneak_S"
-- visual-mode
lvim.keys.visual_mode["<A-s>"] = "<Plug>Sneak_s"
lvim.keys.visual_mode["<A-S>"] = "<Plug>Sneak_S"

-- repeat motion
vim.cmd [[map ; <Plug>Sneak_;]]
vim.cmd [[map , <Plug>Sneak_,]]

-- 1-character enhanced 'f'
vim.cmd [[nmap f <Plug>Sneak_f]]
vim.cmd [[nmap F <Plug>Sneak_F]]
-- visual-mode
vim.cmd [[xmap f <Plug>Sneak_f]]
vim.cmd [[xmap F <Plug>Sneak_F]]

-- 1-character enhanced 't'
vim.cmd [[nmap t <Plug>Sneak_t]]
vim.cmd [[nmap T <Plug>Sneak_T]]
-- visual-mode
vim.cmd [[xmap t <Plug>Sneak_t]]
vim.cmd [[xmap T <Plug>Sneak_T]]

lvim.keys.normal_mode["yon"] = ":setlocal number!<CR>"
lvim.keys.normal_mode["yor"] = ":setlocal relativenumber!<CR>"
lvim.keys.normal_mode["yog"] = ":Gitsigns toggle_signs<CR>"

-- https://www.lunarvim.org/configuration/02-keybindings.html#cursor-movement
lvim.line_wrap_cursor_movement = true
-- vim.opt.scrolloff = 0 -- Required so L moves to the last line
-- lvim.keys.insert_mode["<C-k>"] = "<C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- set keymap with custom opts
-- lvim.keys.insert_mode["po"] = {'<ESC>', { noremap = true }}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- Configure builtin plugins
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.python.formatters = {
  {
    exe = "black",
    args = {}
  }
}
-- set an additional linter
lvim.lang.python.linters = {
  {
    exe = "flake8",
    args = {}
  }
}

-- Additional Plugins
lvim.plugins = {
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"}
  },
  { "tpope/vim-repeat" },
  { "mskar/transwrd" },
  {"justinmk/vim-sneak"},

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- https://www.lunarvim.org/configuration/05-autocommands.html
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*", "setlocal laststatus=0 | set showtabline=0" },
}

-- https://www.lunarvim.org/configuration/03-colorschemes.html#transparent-windows
lvim.transparent_window = true

-- https://www.lunarvim.org/configuration/01-settings.html#example-options
vim.opt.cursorline = false -- don't highlight the current line
vim.opt.cmdheight = 1 -- less space in the neovim command line for displaying messages
vim.opt.number = false
vim.opt.timeoutlen = 200 -- more time to wait for a mapped sequence to complete (in milliseconds)
