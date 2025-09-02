local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

-- keymap("n", "<space>", "<Nop>")

keymap("i", "jk", "<ESC>")
keymap("n", "<leader>-", ":split<CR>")
keymap("n", "<leader>|", ":vsplit<CR>")
keymap("n", "<leader>f", ":Pick files<CR>", { silent = true })
keymap("n", "<S-h>", ":bprev<CR>", { silent = true })
keymap("n", "<S-l>", ":bnext<CR>", { silent = true })
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")

-- Switch window
keymap("n", "<C-h>", "<C-W>h")
keymap("n", "<C-j>", "<C-W>j")
keymap("n", "<C-k>", "<C-W>k")
keymap("n", "<C-l>", "<C-W>l")


-- keymap("n", "j", function()
--     return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
-- end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
-- keymap("n", "k", function()
--     return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
-- end, { expr = true, silent = true }) -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz")                                    -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz")                                    -- Scroll up and center the cursor
-- shortcut
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)                         -- Save the current file
keymap("n", "<Leader>q", "<cmd>q<CR>", s)                          -- Quit Neovim
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)                    -- Open a new tab
keymap("n", "<Leader>|", "<cmd>vsplit<CR>", s)                     -- Split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s)                      -- Split the window horizontally
keymap("n", "grf", ":lua vim.lsp.buf.format()<CR>", s)      -- Format the current buffer using LSP
-- keymap("n", "<Leader>lf", ":lua vim.lsp.buf.format()<CR>", s)      -- Format the current buffer using LSP
keymap("n", "<Leader>la", ":lua vim.lsp.buf.code_action()<CR>", s) -- LSP Code Action ("gra")
keymap("n", "<Leader>li", ":LspInfo<CR>", s)
-- clipboard
keymap({ "n", "v" }, "<Leader>p", '"+p') -- Paste from system clipboard
keymap({ "n", "v" }, "<Leader>P", '"+P') -- Paste from system clipboard
-- keymap("v", "<Leader>p", '"_dP')                              -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s)             -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>")      -- Exit terminal mode

-- Change directory to the current file's directory
-- keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

local opts = { noremap = true, silent = true }
-- lsp
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)  -- Go to definition
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- Go to declaration
--  defaults
-- keymap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- keymap("n", "g0", "<cmd>lua vim.lsp.buf.oducment_symbol()<CR>", opts)
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
-- "an" and "in" are mapped in Visual mode to outer and inner incremental selections, respectively, using vim.lsp.buf.selection_range()

-- vim.pack
keymap("n", "<leader>Pu", ":lua vim.pack.update()<CR>", opts) -- update plugins "pack update"
keymap("n", "<leader>Pm", ":Mason<CR>", opts)                 -- Open Mason
