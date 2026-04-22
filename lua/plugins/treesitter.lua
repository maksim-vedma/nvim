vim.pack.add({
  -- lsp
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Enable treesitter highlighting and disable regex syntax
    pcall(vim.treesitter.start)
    -- Enable treesitter-based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- cb to replace ensure install ?
-- function()
--   local ensureInstalled = {
--     'lua', 'python', 'typescript',
--     -- ... your parsers
--   }
--   local alreadyInstalled = require('nvim-treesitter.config').get_installed()
--   local parsersToInstall = vim.iter(ensureInstalled)
--     :filter(function(parser)
--       return not vim.tbl_contains(alreadyInstalled, parser)
--     end)
--     :totable()
--   require('nvim-treesitter').install(parsersToInstall)
-- end,

