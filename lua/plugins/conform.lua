vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    formatters_by_ft = {
        -- lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        php = { "php_cs_fixer" },
        twig = { "twig-cs-fixer" },
        css = { "prettier" },
        scss = { "prettier" },
        -- python = { "ruff" },
        -- php = { "php-cs-fixer" }, -- custom php command
    },
    formatters = {
        -- ["leptos_fmt"] = {
        --     command = "leptosfmt",
        --     args = {
        --         "leptosfmt",
        --         "--stdin",
        --         "--rustfmt",
        --         -- "$FILENAME",
        --     },
        --     stdin = false,
        -- }
        -- ["php-cs-fixer"] = {
        --     command = "php-cs-fixer",
        --     args = {
        --         "fix",
        --         "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
        --         "$FILENAME",
        --     },
        --     stdin = false,
        -- },
    },
})

-- conform, fallback to vim.lsp.buf.format()
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file with conform" })
