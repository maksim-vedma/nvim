vim.pack.add({
  { src = "https://github.com/nvimtools/none-ls.nvim" }
})

local null_ls = require("null-ls")

local file_exists = function(path)
  local f = io.open(path, "r")
  if f then f:close() end
  return f ~= nil
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.phpstan.with({
      command = "vendor/bin/phpstan",
      condition = function(utils)
        return file_exists("vendor/bin/phpstan")
      end,
    }),
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.completion.spell,
    -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
  },
})
