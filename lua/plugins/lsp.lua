vim.pack.add({
  -- lsp
  -- { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()

-- will load configs from lsp/ dir [lspconfig](https://github.com/neovim/nvim-lspconfig/tree/master/lsp)lspconfig)
-- if nvim-lspconfig plugin is enabled, will load config from the plugin repo instead and need to extend base config using vim.lsp.config('client', {}) (see below)
vim.lsp.enable({
  "bashls",
  "lua_ls",
  "emmet_language_server",
  -- "angularls",
  "cssls",
  "tailwindcss",
  "tinymist",
  "ts_ls",
  "rust-analyzer",
  -- "phpactor",
  "intelephense",
  "twiggy_language_server",
  -- "pylsp",
  "ruff",
  "basepyright",
  "dockerls",
  "docker_compose_language_service",
  "yamlls",
  "vue_ls",
  "jsonls", -- json-lsp
  "biome",
})

vim.diagnostic.config({ virtual_text = true, signs = true })

-- Color preview and color picker via Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.colorProvider then
      vim.lsp.document_color.enable(true, nil, { style = "virtual" })
    end
  end,
})
