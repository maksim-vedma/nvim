vim.pack.add({
    { src = "https://github.com/ccaglak/phptools.nvim" }
})

-- ~/.config/nvim/init.lua
require('phptools').setup({
    ui = {
        enable = false, -- replace vim.ui.select, vim.ui.input, vim.notify with custom floating windows
        fzf = true, -- use fzf for test filtering if available
    },
    custom_toggles = {
        enable = false, -- enable <C-a>/<C-x> word/operator toggles
        -- words = {},      -- additional word toggle groups, e.g. { { "yes", "no" } }
        -- operators = {},  -- additional operator pairs, e.g. { { "&&", "||" } }
    },
    gf = {
        enable = true, -- smart gf navigation for PHP, Blade, Twig
        max_depth = 5, -- max recursion depth for constant resolution
        project_root_markers = { ".git", "composer.json", ".env" },
        excluded_dirs = { "vendor", "node_modules", ".git" },
        custom_constants = {}, -- user-defined constants, e.g. { MY_CONST = "/path/to/dir" }
        keymaps = {        -- set any to false to disable
            gf = "gf",
            browse_components = "<leader>gC",
            browse_livewire = "<leader>gw",
            toggle_livewire = "<leader>gW",
            browse_routes = "<leader>gr",
            browse_logs = "<leader>gl",
            tail_logs = "<leader>gL",
        },
    },
    property_hooks = {
        enable = true, -- PHP 8.4 property hooks generation
    },
})

local map = vim.keymap.set

-- PhpTools code generation
-- map('n', '<leader>ll', '<cmd>PhpTools Smart<cr>', { desc = 'Smart detect (method or class)' })
map('n', '<leader>lpm', '<cmd>PhpTools Method<cr>', { desc = 'Generate method' })
-- map('n', '<leader>lc', '<cmd>PhpTools Class<cr>', { desc = 'Generate class' })
map('n', '<leader>lpg', '<cmd>PhpTools GetSet<cr>', { desc = 'Generate getter/setter' })
map('n', '<leader>lph', '<cmd>PhpTools PropertyHooks<cr>', { desc = 'Generate property hooks' })
map('n', '<leader>lpc', '<cmd>PhpTools Create<cr>', { desc = 'Create PHP entity' })

-- PHP utilities
-- map('n', '<leader>ls', '<cmd>PhpTools Scripts<cr>', { desc = 'Run Composer scripts' })
map('n', '<leader>lpn', '<cmd>PhpTools Namespace<cr>', { desc = 'Generate namespace' })
-- map('v', '<leader>lpr', '<cmd>PhpTools Refactor<cr>', { desc = 'Refactor selection' })

-- IDE Helper commands
-- local ide_helper = require('phptools.ide_helper')
-- map('n', '<leader>lha', ide_helper.generate_all, { desc = 'Generate all IDE helpers' })
-- map('n', '<leader>lhm', ide_helper.generate_models, { desc = 'Generate model helpers' })
-- map('n', '<leader>lhf', ide_helper.generate_facades, { desc = 'Generate facade helpers' })
-- map('n', '<leader>lht', ide_helper.generate_meta, { desc = 'Generate meta helper' })
-- map('n', '<leader>lhi', ide_helper.install, { desc = 'Install IDE Helper package' })

-- Test runner commands
-- local tests = require("phptools.tests")
-- map('n', '<Leader>ta', tests.test.all, { desc = 'Run all tests' })
-- map('n', '<Leader>tf', tests.test.file, { desc = 'Run file tests' })
-- map('n', '<Leader>tl', tests.test.line, { desc = 'Run test at cursor' })
-- map('n', '<Leader>ts', tests.test.filter, { desc = 'Search and run test' })
-- map('n', '<Leader>tp', tests.test.parallel, { desc = 'Run tests in parallel' })
-- map('n', '<Leader>tr', tests.test.rerun, { desc = 'Rerun last test' })
-- map('n', '<Leader>ti', tests.test.selected, { desc = 'Run selected test file' })
