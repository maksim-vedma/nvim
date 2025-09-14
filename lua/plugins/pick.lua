vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
})

require('mini.pick').setup()
local opt = { silent = true }

vim.keymap.set('n', '<leader>f', ":Pick files<CR>", opt) -- Duplicate is intentionnal - defaults to Pick git files
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>", opt)
vim.keymap.set('n', '<leader>fF', ":Pick files tool='git'<CR>", opt)
vim.keymap.set('n', '<leader>fd', ":Pick buffers<CR>", opt) -- "fd" simply because it's faster to write than "fb"
vim.keymap.set('n', '<leader>fg', ":Pick grep<CR>", opt)
vim.keymap.set('n', '<leader>fh', ":Pick help<CR>", opt)
