-- git
vim.pack.add({
    -- git
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
})

require('gitsigns').setup({ signcolumn = false })

vim.keymap.set("n", "<leader>gs", '<cmd>Git<CR>')
vim.keymap.set("n", "<leader>gp", '<cmd>Git push<CR>')
