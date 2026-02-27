vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
})

-- Centered on screen
local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW', height = height, width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require('mini.pick').setup({
    -- Window related options
    window = {
        -- Float window config (table or callable returning it)
        config = win_config,

        -- String to use as caret in prompt
        -- prompt_caret = '▏',
        prompt_caret = '█',

        -- String to use as prefix in prompt
        prompt_prefix = '> ',
    },
})
local opt = { silent = true }

vim.keymap.set('n', '<leader>f', ":Pick files<CR>", opt) -- Duplicate is intentionnal - defaults to Pick git files
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>", opt)
vim.keymap.set('n', '<leader>fF', ":Pick files tool='git'<CR>", opt)
vim.keymap.set('n', '<leader>fd', ":Pick buffers<CR>", opt) -- "fd" simply because it's faster to write than "fb"
vim.keymap.set('n', '<leader>fg', ":Pick grep<CR>", opt)
vim.keymap.set('n', '<leader>fl', ":Pick grep_live<CR>", opt)
vim.keymap.set('n', '<leader>fh', ":Pick help<CR>", opt)


local MiniPick = require('mini.pick')

local function git_conflict_files()
  local handle = io.popen("git diff --name-only --diff-filter=U")
  if not handle then return {} end

  local result = handle:read("*a")
  handle:close()

  local files = {}
  for file in result:gmatch("[^\r\n]+") do
    table.insert(files, file)
  end

  return files
end

local function pick_git_conflicts()
  MiniPick.start({
    source = {
      name = "Git Conflicts",
      items = git_conflict_files(),
    },
  })
end

vim.keymap.set("n", "<leader>gc", pick_git_conflicts)
