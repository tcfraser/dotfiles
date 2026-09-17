local group = vim.api.nvim_create_augroup("ExternalFileChanges", { clear = true })

local function check_external_changes()
    local mode = vim.api.nvim_get_mode()
    -- Avoid interrupting typing, command entry, or a pending prompt.
    if mode.mode == "n" and not mode.blocking and vim.fn.getcmdwintype() == "" then
        -- Keep the built-in prompt when both the buffer and disk have changed.
        vim.cmd("checktime")
    end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "InsertLeave", "TermLeave" }, {
    group = group,
    callback = function()
        vim.schedule(check_external_changes)
    end,
})

-- Poll even when Neovim is idle and the terminal doesn't report focus changes.
local timer = vim.fn.timer_start(2000, check_external_changes, { ["repeat"] = -1 })

vim.api.nvim_create_autocmd("VimLeavePre", {
    group = group,
    callback = function()
        vim.fn.timer_stop(timer)
    end,
})
