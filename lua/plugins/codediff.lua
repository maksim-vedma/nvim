-- codediff.nvim — VSCode-style diff / merge review UI
--
-- Dedicated file: this is the only place CodeDiff is configured.
-- To remove: delete this file, remove `require("plugins.codediff")` from
-- init.lua, restart, then `:lua vim.pack.del({ "codediff.nvim" })`.

vim.pack.add({
    { src = "https://github.com/esmuellert/codediff.nvim" },
})

require("codediff").setup({
    diff = {
        layout = "side-by-side",
        -- conflict view: left = incoming (theirs, :3), right = current (ours, :2)
        conflict_ours_position = "right",
        -- "bottom" = VSCode-style result below; use "center" for 3 columns
        conflict_result_position = "bottom",
        conflict_result_height = 30, -- percentage of total height
        hide_merge_artifacts = true, -- hide *.orig / *.LOCAL.* / *.REMOTE.*
    },
    explorer = {
        view_mode = "tree",
        flatten_dirs = true,
        visible_groups = { staged = true, unstaged = true, conflicts = true },
        line_stats = { enabled = true, count_untracked = false },
    },
    keymaps = {
        conflict = {
            accept_incoming = "<leader>ct", -- left  = theirs / incoming
            accept_current = "<leader>co",  -- right = ours / current
            accept_both = "<leader>cb",
            discard = "<leader>cx",
            accept_all_incoming = "<leader>cT", -- whole file
            accept_all_current = "<leader>cO",  -- whole file
            accept_all_both = "<leader>cB",     -- whole file
            discard_all = "<leader>cX",         -- reset to base
            next_conflict = "]x",
            prev_conflict = "[x",
            diffget_incoming = "2do", -- result pane only
            diffget_current = "3do",  -- result pane only
        },
    },
})

local map = vim.keymap.set

-- Review workspace: Changes / Staged Changes / Merge Changes
map("n", "<leader>gD", "<cmd>CodeDiff<CR>", { desc = "CodeDiff: git diff review" })

-- 3-way merge view for the conflicted file in the current buffer
map("n", "<leader>gc", function()
    local file = vim.api.nvim_buf_get_name(0)
    if file == "" or vim.fn.filereadable(file) == 0 then
        vim.notify("CodeDiff: current buffer is not a file", vim.log.levels.WARN)
        return
    end
    if #vim.fn.systemlist({ "git", "ls-files", "-u", "--", file }) == 0 then
        vim.notify("CodeDiff: file has no merge conflicts", vim.log.levels.WARN)
        return
    end
    vim.cmd("CodeDiff merge " .. vim.fn.fnameescape(file))
end, { desc = "CodeDiff: resolve conflict in current file" })

-- History for the current file
map("n", "<leader>gH", "<cmd>CodeDiff history %<CR>", { desc = "CodeDiff: file history" })
