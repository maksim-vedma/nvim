---@type vim.lsp.Config
return {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
        formatterMode = "typstyle", -- "typstyle" or "typstfmt"
        exportPdf = "onType",
        semanticTokens = "disable"
    },
}
