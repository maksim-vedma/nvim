---@brief
---
--- https://github.com/astral-sh/ruff
---
--- Ruff's built-in language server. Installed via Mason as `ruff`.
--- Example server settings can be provided with:
--- ```lua
--- vim.lsp.config('ruff', {
---   init_options = { settings = {} },
--- })
--- ```

---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
}
