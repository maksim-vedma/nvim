vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
})

require('oil').setup()
vim.keymap.set('n', '-', ':Oil<CR>', {silent= true})

