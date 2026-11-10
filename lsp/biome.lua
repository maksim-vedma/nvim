---@brief
---
--- https://biomejs.dev
---
--- Biome language server. Installed via Mason as `biome`, or use the project
--- local `node_modules/.bin/biome` when available.

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = 'biome'
    local root = (config or {}).root_dir
    if root then
      local local_cmd = vim.fs.joinpath(root, 'node_modules/.bin/biome')
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, 'lsp-proxy' }, dispatchers)
  end,
  filetypes = {
    'astro',
    'css',
    'graphql',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'jsonc',
    'svelte',
    'typescript',
    'typescript.tsx',
    'typescriptreact',
    'vue',
  },
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local has_config = vim.fs.find(
      { 'biome.json', 'biome.jsonc' },
      { path = filename, type = 'file', upward = true, limit = 1 }
    )[1]
    if not has_config then
      return
    end

    local root = vim.fs.root(filename, {
      'package-lock.json',
      'yarn.lock',
      'pnpm-lock.yaml',
      'bun.lockb',
      'bun.lock',
      '.git',
    }) or vim.fs.dirname(filename)

    on_dir(root)
  end,
}
