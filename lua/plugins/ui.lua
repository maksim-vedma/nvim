-- ui
vim.pack.add({
    -- icons
    { src = "https://github.com/nvim-mini/mini.icons" },
    -- bufferline
    { src = "https://github.com/nvim-mini/mini.tabline" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    -- toasts
    -- fidget (lsp loading)
    -- noice (notify ?)
})

require("mini.icons").setup()
require("mini.tabline").setup()
require("fidget").setup({})
