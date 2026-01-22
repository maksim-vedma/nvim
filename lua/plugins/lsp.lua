vim.pack.add({
    -- lsp
    -- { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("mason").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "html",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "rust",
        "yaml",
        "python",
        "rust_with_rstml" -- Leptos RSX syntax
    },
    highlight = {
        enable = true,
        enabled = true,
    },
    indent = {
        enable = true,
        enabled = true,
    },
})

-- will load configs from lsp/ dir [lspconfig](https://github.com/neovim/nvim-lspconfig/tree/master/lsp)lspconfig)
-- if nvim-lspconfig plugin is enabled, will load config from the plugin repo instead and need to extend base config using vim.lsp.config('client', {}) (see below)
vim.lsp.enable({
    "bashls",
    "lua_ls",
    "emmet_language_server",
    "angular-language-server",
    "angular_ls",
    "angularls",
    "tailwindcss",
    "tinymist",
    -- "ts_ls",
    "rust-analyzer",
    "phpactor",
    -- "intelephense",
    "twiggy_language_server",
    -- "pylsp",
    "ruff",
    "basepyright",
    "dockerls",
    "docker_compose_language_service", -- not recognized ?
    "yamlls",
    "mmdc", -- mermaid uml
    "vts_ls", -- newer ts_ls ?
    "vue_ls",
})

-- vue try
-- local vue_language_server_path = '~/.local/share/nvim/mason/packages/vue-language-server'
-- local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
-- local vue_plugin = {
--   name = '@vue/typescript-plugin',
--   location = vue_language_server_path,
--   languages = { 'vue' },
--   configNamespace = 'typescript',
-- }

-- vue try
-- 1. Dynamically find the Mason path for the Vue plugin


-- IMPORTANT: nvchad users cannot use `$MASON` directly as the option is set to `skip`, see: https://github.com/NvChad/NvChad/blob/29ebe31ea6a4edf351968c76a93285e6e108ea08/lua/nvchad/configs/mason.lua#L4

local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

-- local ts_ls_config = {
--   init_options = {
--     plugins = {
--       vue_plugin,
--     },
--   },
--   filetypes = tsserver_filetypes,
-- }

-- If you are on most recent `nvim-lspconfig`
local vue_ls_config = {}
-- If you are not on most recent `nvim-lspconfig` or you want to override
local vue_ls_config = {
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, context)
      local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })
      local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
      local clients = {}

      vim.list_extend(clients, ts_clients)
      vim.list_extend(clients, vtsls_clients)

      if #clients == 0 then
        vim.notify('Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        command = 'typescript.tsserverRequest',
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
          local response = r and r.body
          -- TODO: handle error or response nil here, e.g. logging
          -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
          local response_data = { { id, response } }

          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify('tsserver/response', response_data)
        end)
    end
  end,
}
-- nvim 0.11 or above
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
-- vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.enable({'vtsls', 'vue_ls'}) -- If using `ts_ls` replace `vtsls` to `ts_ls`
-- keep this
vim.diagnostic.config({ virtual_text = true, signs = true })
