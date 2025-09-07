vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
})

require('oil').setup({
    view_options = {
        show_hidden = true,
        is_always_hidden = function (name)
            return name == '..' or name == '.git'
        end,
    },
})
vim.keymap.set('n', '-', ':Oil<CR>', {silent= true})

