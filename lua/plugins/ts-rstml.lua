vim.pack.add({
    { src = "https://github.com/rayliwell/tree-sitter-rstml" },
})

require("tree-sitter-rstml").setup()
-- run "TSInstall rust_with_rstml" afterward
