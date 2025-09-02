vim.pack.add({
    { src = "https://github.com/webhooked/kanso.nvim" },
    -- { src = "https://github.com/mcauley-penney/techbase.nvim" },
})

require('kanso').setup({})

vim.cmd("colorscheme kanso")
