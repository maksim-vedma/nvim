vim.pack.add({
    { src = "https://github.com/webhooked/kanso.nvim" },
    { src = "https://github.com/oahlen/iceberg.nvim" },
    { src = "https://github.com/mcauley-penney/techbase.nvim" },
})

require('kanso').setup({
    compile = true,
    transparent = false,
    overrides = function(colors)
        return {
            CodeiumSuggestion = { fg = colors.palette.gray3 },
        }
    end,
    background = {
        dark = "zen",
        light = "pearl",
    },
    minimal = true,
    foreground = "default",
    colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
    },
})

vim.cmd("colorscheme kanso-zen")
