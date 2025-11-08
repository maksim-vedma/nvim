vim.pack.add({
    { src = "https://github.com/webhooked/kanso.nvim" },
    { src = "https://github.com/oahlen/iceberg.nvim" },
    { src = "https://github.com/mcauley-penney/techbase.nvim" },
})

require('kanso').setup({
    transparent = false,
    overrides = function(colors)
        return {
            CodeiumSuggestion = { fg = colors.palette.gray3 },
        }
    end,
})

vim.cmd("colorscheme kanso-zen")
