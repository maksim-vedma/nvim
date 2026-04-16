vim.pack.add({
    { src = "https://github.com/webhooked/kanso.nvim" },
    { src = "https://github.com/mcauley-penney/techbase.nvim" },
    { src = "https://github.com/datsfilipe/vesper.nvim" },
    { src = "https://github.com/aikhe/fleur.nvim" },
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
    { src = "https://github.com/slugbyte/lackluster.nvim" },
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
-- vim.cmd("colorscheme fleur")
-- vim.cmd("colorscheme lackluster-hack")
