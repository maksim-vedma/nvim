-- git
vim.pack.add({
    -- git
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
})

require('gitsigns').setup({
    signcolumn = true,
    current_line_blame = true,
})

vim.keymap.set("n", "<leader>gb", ':Gitsigns blame<CR>', { silent = true })
vim.keymap.set("n", "<leader>gs", ':Git<CR>', { silent = true })
vim.keymap.set("n", "<leader>gd", ':Gvdiffsplit!<CR>', { silent = true, desc = "Open a 3-way vertical diff view" })
vim.keymap.set("n", "<leader>gh", ':diffget //2<Bar>diffupdate<CR>', { silent = false, desc = "Accept source branch" })
vim.keymap.set("n", "<leader>gl", ':diffget //3<Bar>diffupdate<CR>', { silent = false, desc = "Accept incoming branch changes"})

-- vim.keymap.set("n", "<leader>ga", ':Git add %<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>gp", ':Git push<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>gP", ':Git pull<CR>', { silent = true })
