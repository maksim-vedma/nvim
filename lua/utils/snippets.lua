-- Small helpers shared by the LuaSnip snippet files in ~/.config/nvim/snippets.
local M = {}

--- Uppercase the first character of `s` ("article" -> "Article").
--- Safe for nil/empty strings; leaves multibyte first chars untouched.
---@param s string|nil
---@return string
function M.capitalize(s)
    if not s or s == "" then
        return ""
    end
    return (s:gsub("^%l", string.upper))
end

--- PascalCase name of the current buffer's file, without extension.
--- "my-article.tsx" -> "MyArticle"; "Name" for unnamed buffers.
---@return string
function M.resource_name()
    local name = vim.fn.expand("%:t:r")
    if name == "" then
        return "Name"
    end
    name = M.capitalize(name)
    name = name:gsub("%-(%l)", function(c)
        return c:upper()
    end)
    return name
end

return M
