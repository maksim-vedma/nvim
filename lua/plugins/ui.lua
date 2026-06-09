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

require('mini.icons').setup({
    style     = 'glyph',

    -- Customize per category. See `:h MiniIcons.config` for details.
    default   = {},
    directory = {
        -- Syntaxe : ["nom_du_dossier"] = { glyph = "icône", hl = "GroupeDeCouleur" }

        -- React / Logic
        -- ["components"] = { glyph = "󰡀", hl = "MiniIconsAzure" },
        -- ["store"]      = { glyph = "", hl = "MiniIconsYellow" },
        -- ["hooks"]      = { glyph = "󱐋", hl = "MiniIconsOrange" },

        -- Atomic Design
        -- ["atoms"]      = { glyph = "", hl = "MiniIconsCyan" },
        -- ["molecules"]  = { glyph = "󰨗", hl = "MiniIconsGreen" },
        -- ["organisms"]  = { glyph = "󰵗", hl = "MiniIconsPurple" },
        -- ["templates"]  = { glyph = "󰟀", hl = "MiniIconsRed" },
    },
    extension = {},
    file      = {},
    filetype  = {},
    lsp       = {},
    os        = {},
})

require("mini.tabline").setup()
require("fidget").setup({})
