vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.ai" },
})

local ai = require("mini.ai");
ai.setup(
    {
        -- Table with textobject id as fields, textobject specification as values.
        -- Also use this to disable builtin textobjects. See |MiniAi.config|.
        custom_textobjects = nil,
        -- custom_textobjects = {
        --     -- 'f' pour l'appel de fonction (function call)
        --     f = ai.gen_spec.treesitter({ a = '@call.outer', i = '@call.inner' }),
        --
        --     -- 'F' pour la définition de fonction/méthode
        --     F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
        --
        --     -- 'c' pour la classe
        --     c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
        -- },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Main textobject prefixes
            around = 'a',
            inside = 'i',

            -- Next/last variants
            -- NOTE: These override built-in LSP selection mappings on Neovim>=0.12
            -- Map LSP selection manually to use it (see `:h MiniAi.config`)
            around_next = 'an',
            inside_next = 'in',
            around_last = 'al',
            inside_last = 'il',

            -- Move cursor to corresponding edge of `a` textobject
            goto_left = 'g[',
            goto_right = 'g]',
        },

        -- Number of lines within which textobject is searched
        n_lines = 50,

        -- How to search for object (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
        search_method = 'cover_or_next',

        -- Whether to disable showing non-error feedback
        -- This also affects (purely informational) helper messages shown after
        -- idle time if user input is required.
        silent = false,
    }
)
