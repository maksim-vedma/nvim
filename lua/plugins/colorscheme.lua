vim.pack.add({
    { src = "https://github.com/webhooked/kanso.nvim" },
    { src = "https://github.com/mcauley-penney/techbase.nvim" },
    { src = "https://github.com/datsfilipe/vesper.nvim" },
    { src = "https://github.com/aikhe/fleur.nvim" },
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
    { src = "https://github.com/slugbyte/lackluster.nvim" },
})


require('kanso').setup({
    compile = true, -- need to run KansoCompile (maybe twice...)
    transparent = true,
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
    overrides = function(colors)
        return {
            CodeiumSuggestion = { fg = colors.palette.gray3 },
            -- https://github.com/webhooked/kanso.nvim/blob/main/lua/kanso/highlights/editor.lua
            ModeMsg = { fg = colors.palette.blue3, bold = true },
            -- React component name
            ["@tag.tsx"] = { link = "Component" },
            -- Vue component name
            ["@lsp.type.component.vue"] = { link = "Component" },
            Component = { link = "Type" },
        }
    end,

})



vim.cmd("colorscheme kanso-zen")
-- vim.cmd("colorscheme fleur")
-- vim.cmd("colorscheme lackluster-hack")

-- Kanso palette colors
-- red = "#C34043",
-- red2 = "#E46876",
-- red3 = "#c4746e",
-- yellow = "#DCA561",
-- yellow2 = "#E6C384",
-- yellow3 = "#c4b28a",
-- green = "#98BB6C",
-- green2 = "#87a987",
-- green3 = "#8a9a7b",
-- green4 = "#6A9589",
-- green5 = "#7AA89F",
-- blue = "#7FB4CA",
-- blue2 = "#658594",
-- blue3 = "#8ba4b0",
-- blue4 = "#8ea4a2",
-- violet = "#938AA9",
-- violet2 = "#8992a7",
-- violet3 = "#949fb5",
-- pink = "#a292a3",
-- orange = "#b6927b",
-- orange2 = "#b98d7b",
-- aqua = "#8ea4a2",

-- local fleur = {
-- coquelicot = "#FF8080",
--   zinnia = "#FFBA9D",
--   bruyere = "#8ABE8A",
--   anemone = "#485571",
--   bleuet = "#6D89A7",
--   lis = "#C9D9D8",
--
--   lulumi = "#A8DFDC",
--   maomi = "#323333",
--
--   black = "#101010",
--   gray1 = "#141414",
--   gray2 = "#181818",
--   gray3 = "#2A2A2A",
--   gray4 = "#3D3D3D",
--   gray5 = "#525252",
--   gray6 = "#676767",
--   gray7 = "#939393",
--   gray8 = "#B7B7B7",
--   gray9 = "#EDEDED",
-- }
