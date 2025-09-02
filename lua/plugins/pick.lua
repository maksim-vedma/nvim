vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
})

require('mini.pick').setup()
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
vim.keymap.set('n', '<leader>fg', ":Pick grep<CR>")
vim.keymap.set('n', '<leader>fh', ":Pick help<CR>")
