vim.pack.add({
    { src = "https://github.com/L3MON4D3/LuaSnip" }
})

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-e>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump(-1) end, {silent = true})
