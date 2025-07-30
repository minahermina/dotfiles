local M = {}

function M.open_tmux_pane(dir)
    local file_path = vim.api.nvim_buf_get_name(0)
    local file_dir = vim.fn.fnamemodify(file_path, ":p:h")
    local tmux = vim.fn.exists('$TMUX')

    if file_dir == "" then
        print("No file is open")
        return
    end

    -- Calculate 30% of current nvim window height
    local ui = vim.api.nvim_list_uis()[1]
    local percent_height = math.floor(ui.height * 0.3)

    if tmux == 1 then
        local tmux_cmd = ""

        if dir == 0 then
            tmux_cmd = string.format("tmux split-window -v -l %d -c '%s'", percent_height, file_dir)
        else
            tmux_cmd = string.format("tmux split-window -h -l 60 -c '%s'", file_dir)
        end

        vim.fn.system(tmux_cmd)
    else
        vim.cmd("sp | term")
        vim.cmd("resize " .. percent_height)
    end
end



function M.toggle_quickfix()
    local quickfix_open = false
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win['quickfix'] == 1 then
            quickfix_open = true
            break
        end
    end

    if quickfix_open then
        vim.cmd('cclose')
    else
        vim.cmd('copen')
    end
end

return M

