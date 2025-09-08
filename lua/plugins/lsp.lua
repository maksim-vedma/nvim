vim.pack.add({
    -- lsp
    -- { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("mason").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = { "html", "javascript", "typescript", "tsx", "php", "rust", "yaml" },
    highlight = { enabled = true },
    indent = { enabled = true },
})

-- will load configs from lsp/ dir [lspconfig](https://github.com/neovim/nvim-lspconfig/tree/master/lsp)lspconfig)
-- if nvim-lspconfig plugin is enabled, will load config from the plugin repo instead and need to extend base config using vim.lsp.config('client', {}) (see below)
vim.lsp.enable({
    -- "bashls",
    "lua_ls",
    "emmet_language_server",
    "angular-language-server",
    "angular_ls",
    "angularls",
    "tailwindcss",
    "tinymist",
    "ts_ls",
    "rust-analyzer",
    "phpactor",
})

-- lsp config can be extended this way if nvim-lspconfig is activated
-- vim.lsp.config('<client name>', {
--   root_dir = vim.fn.fnamemodify(debug.getinfo(1, 'S').source:sub(2), ':p:h'),
-- })

vim.diagnostic.config({ virtual_text = true, signs = true })
