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
vim.keymap.set("n", "<leader>gd", ':Gdiffsplit<CR>', { silent = true })

-- vim.keymap.set("n", "<leader>ga", ':Git add %<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>gp", ':Git push<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>gP", ':Git pull<CR>', { silent = true })
