-- ~/.config/nvim-new/lua/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

-- restore cursor to file position in previous editing session
autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
            -- defer centering slightly so it's applied after render
            vim.schedule(function()
                vim.cmd("normal! zz")
            end)
        end
    end,
})
--
-- auto resize splits when the terminal's window is resized
autocmd("VimResized", {
    command = "wincmd =",
})

-- no auto continue comments on new line
autocmd("FileType", {
    group = augroup("no_auto_comment", {}),
    callback = function()
        -- vim.opt_local.formatoptions:remove({ "c", "r", "o" })
        vim.opt_local.formatoptions:remove({ "o" })
    end,
})

-- syntax highlighting for dotenv files
autocmd("BufRead", {
    group = augroup("dotenv_ft", { clear = true }),
    pattern = { ".env", ".env.*" },
    callback = function()
        vim.bo.filetype = "dosini"
    end,
})

-- show cursorline only in active window enable
-- autocmd({ "WinEnter", "BufEnter" }, {
-- 	group = augroup("active_cursorline", { clear = true }),
-- 	callback = function()
-- 		vim.opt_local.cursorline = true
-- 	end,
-- })

-- ide like highlight when stopping cursor
autocmd("CursorMoved", {
    group = augroup("LspReferenceHighlight", { clear = true }),
    desc = "Highlight references under cursor",
    callback = function()
        -- Only run if the cursor is not in insert mode
        if vim.fn.mode() ~= "i" then
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            local supports_highlight = false
            for _, client in ipairs(clients) do
                if client.server_capabilities.documentHighlightProvider then
                    supports_highlight = true
                    break -- Found a supporting client, no need to check others
                end
            end

            -- 3. Proceed only if an LSP is active AND supports the feature
            if supports_highlight then
                vim.lsp.buf.clear_references()
                vim.lsp.buf.document_highlight()
            end
        end
    end,
})

-- ide like highlight when stopping cursor
autocmd("CursorMoved", {
    group = augroup("LspReferenceHighlight", { clear = true }),
    desc = "Highlight references under cursor",
    callback = function()
        -- Only run if the cursor is not in insert mode
        if vim.fn.mode() ~= "i" then
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            local supports_highlight = false
            for _, client in ipairs(clients) do
                if client.server_capabilities.documentHighlightProvider then
                    supports_highlight = true
                    break -- Found a supporting client, no need to check others
                end
            end

            -- 3. Proceed only if an LSP is active AND supports the feature
            if supports_highlight then
                vim.lsp.buf.clear_references()
                vim.lsp.buf.document_highlight()
            end
        end
    end,
})

