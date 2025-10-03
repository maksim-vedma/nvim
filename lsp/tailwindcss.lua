-- ---@type vim.lsp.Config
-- return {
--     tailwindcss = {
--         filetypes = {
--             "templ",
--             "vue",
--             "html",
--             "astro",
--             "javascript",
--             "typescript",
--             "react",
--             "htmlangular",
--             "rust",
--         },
--     },
-- }
-- ---@brief
--- https://github.com/tailwindlabs/tailwindcss-intellisense
---
--- Tailwind CSS Language Server can be installed via npm:
---
--- npm install -g @tailwindcss/language-server
-- local util = require 'lspconfig.util'

---@type vim.lsp.Config
return {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    -- filetypes copied and adjusted from tailwindcss-intellisense
    filetypes = {
        -- html
        'aspnetcorerazor',
        'astro',
        'astro-markdown',
        'blade',
        'clojure',
        'django-html',
        'htmldjango',
        'edge',
        'eelixir', -- vim ft
        'elixir',
        'ejs',
        'erb',
        'eruby', -- vim ft
        'gohtml',
        'gohtmltmpl',
        'haml',
        'handlebars',
        'hbs',
        'html',
        'htmlangular',
        'html-eex',
        'heex',
        'jade',
        'leaf',
        'liquid',
        'markdown',
        'mdx',
        'mustache',
        'njk',
        'nunjucks',
        'php',
        'razor',
        'slim',
        'twig',
        'rust',
        -- css
        'css',
        'less',
        'postcss',
        'sass',
        'scss',
        'stylus',
        'sugarss',
        -- js
        'javascript',
        'javascriptreact',
        'reason',
        'rescript',
        'typescript',
        'typescriptreact',
        -- mixed
        'vue',
        'svelte',
        'templ',
    },
    settings = {
        tailwindCSS = {
            validate = true,
            lint = {
                cssConflict = 'warning',
                invalidApply = 'error',
                invalidScreen = 'error',
                invalidVariant = 'error',
                invalidConfigPath = 'error',
                invalidTailwindDirective = 'error',
                recommendedVariantOrder = 'warning',
            },
            classAttributes = {
                'class',
                'className',
                'class:list',
                'classList',
                'ngClass',
            },
            includeLanguages = {
                eelixir = 'html-eex',
                elixir = 'phoenix-heex',
                eruby = 'erb',
                heex = 'phoenix-heex',
                htmlangular = 'html',
                templ = 'html',
                rust = 'html',
            },
            experimental = {
                classRegex = {
                    -- tailwind fuze support 
                    "#[tw\\\\([^\\]]*class\\s*=\\s*\"([^\"]*)\"\\)]", "\"([^\"]*)\"",
                }
            }
        },
    },
    root_markers = {
        -- '.git',
        'tailwind.conf.js',
        'tailwind.css'
    },
}
