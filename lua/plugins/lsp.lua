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
  "tailwindcss",
  "tinymist",
  "ts_ls",
  "rust-analyzer",
  "phpactor",
})

vim.lsp.config('phpactor', {})
vim.diagnostic.config({ virtual_text = true })
