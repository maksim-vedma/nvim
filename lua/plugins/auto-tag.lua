vim.pack.add({
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("nvim-ts-autotag").setup({
    per_filetype = {
        ["php"] = {
            enable_close = false -- needed to enable lsp suggestion on "->"
        }
    }
})
