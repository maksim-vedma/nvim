-- Yank a visual selection as a fenced Markdown code block into the system
-- clipboard, inferring the fence language from the buffer filetype.
local M = {}

-- Filetypes whose Markdown fence id differs from the Neovim filetype name.
local FT_ALIASES = {
    sh = "bash",
    dosini = "ini",
    cs = "csharp",
    javascriptreact = "jsx",
    typescriptreact = "tsx",
    terraform = "hcl",
    blade = "php", -- GitHub renders .blade.php as PHP
    gitconfig = "ini",
}

-- UI / non-code buffers: emit a plain fence (no language).
local NO_LANG = {
    text = true,
    help = true,
    qf = true,
    oil = true,
    terminal = true,
    gitcommit = true,
    gitrebase = true,
    fugitive = true,
    notify = true,
    checkhealth = true,
    ["codediff-explorer"] = true,
}

local function sanitize(lang)
    if not lang or lang == "" then
        return nil
    end
    lang = lang:gsub("^%s+", ""):gsub("%s+$", ""):gsub("[^%w_+.#-]", "")
    return lang ~= "" and lang or nil
end

--- Fence language for a buffer (nil = plain fence).
function M.lang(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype
    if ft == "" then
        -- filetype not set yet: fall back to the extension
        ft = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":e")
    end
    if ft == "" or NO_LANG[ft] then
        return nil
    end
    return sanitize(FT_ALIASES[ft] or ft)
end

-- Pick a fence long enough that the content cannot close it early
-- (selecting an existing ``` block yields a 4-backtick fence).
local function fence(body)
    local longest = 0
    for run in body:gmatch("`+") do
        longest = math.max(longest, #run)
    end
    return string.rep("`", math.max(3, longest + 1))
end

--- Wrap lines in a fenced code block. Pure function, easy to test.
function M.wrap(lines, lang)
    local body = type(lines) == "table" and table.concat(lines, "\n") or lines
    local f = fence(body)
    return f .. (lang or "") .. "\n" .. body .. "\n" .. f
end

--- Yank the visual selection as a Markdown code block.
function M.yank()
    -- `visualmode()` can be empty in some contexts; mode(1) is reliable.
    local m = vim.fn.mode(1):sub(1, 1)
    m = ({ s = "v", S = "V", ["\19"] = "\22" })[m] or m -- select -> visual
    if m ~= "v" and m ~= "V" and m ~= "\22" then
        vim.notify("codeblock: no visual selection", vim.log.levels.WARN)
        return
    end

    local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = m })
    local text = M.wrap(lines, M.lang())

    vim.fn.setreg("+", text) -- system clipboard
    vim.fn.setreg('"', text) -- so `p` inside nvim pastes the block too

    -- A Lua x-mode mapping does NOT leave visual mode by itself.
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false
    )
    return text
end

return M
