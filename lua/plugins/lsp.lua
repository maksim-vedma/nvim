vim.pack.add({
    -- lsp
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("mason").setup()

vim.lsp.enable({
  -- "bashls",
  "lua_ls",
  "emmet_language_server",
  "tailwind_language_server",
  "tinymist",
  "ts_ls",
  "rust-analyzer",
})

vim.lsp.config('tailwind_language_server', {})

-- vim.lsp.config('rust-analyzer', {
--     settings = {
--         ['rust-analyser'] = {},
--     }
-- })

vim.diagnostic.config({ virtual_text = true })
