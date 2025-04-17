local M = {}

function M.test()
    local cwd = vim.fn.getcwd()

    vim.ui.input({
        prompt = "Enter makeprg command in " .. cwd .. ": ",
    }, function(input)
        if input and input ~= "" then
            vim.o.makeprg = input
            vim.cmd(':w')

            -- Clear quickfix list before running
            vim.fn.setqflist({}, "r")

            -- Collect output for quickfix parsing
            local output = {}

            -- Run make asynchronously
            vim.fn.jobstart(input, {
                stdout_buffered = true,
                stderr_buffered = true,
                on_stdout = function(_, data, _)
                    if data then
                        for _, line in ipairs(data) do
                            table.insert(output, line)
                        end
                    end
                end,
                on_stderr = function(_, data, _)
                    if data then
                        for _, line in ipairs(data) do
                            table.insert(output, line)
                        end
                    end
                end,
                on_exit = function(_, exit_code, _)
                    vim.schedule(function()
                        -- Parse output into quickfix format using errorformat
                        local items = vim.fn.getqflist({ title = "Make Output", lines = output })
                        vim.fn.setqflist({}, "r", items)

                        -- Open quickfix if there were errors
                        vim.cmd("copen")
                    end)
                end,
            })
        end
    end)
end





-- Extended version with more features
function M.run_shell_command()
    local cwd = vim.fn.getcwd()

    local function complete_shell(input, line, pos)
        local lead = input:match("^%s*(.-)%s*$")
        local parts = vim.split(lead, "%s+", { trimempty = true })
        local last_part = parts[#parts] or ""

        -- Command completion
        if #parts <= 1 then
            local commands = vim.fn.getcompletion(lead, "command")
            -- Add some common shell builtins if you want
            vim.list_extend(commands, {"cd", "echo", "mkdir"})
            table.sort(commands)
            return commands
        end

        -- File/directory completion with type indicators
        local files = vim.fn.getcompletion(last_part, "file")
        local completions = {}
        for _, file in ipairs(files) do
            local full_path = vim.fn.fnamemodify(cwd .. "/" .. file, ":p")
            if vim.fn.isdirectory(full_path) == 1 then
                table.insert(completions, file .. "/")
            else
                table.insert(completions, file)
            end
        end

        return vim.tbl_filter(function(item)
            return item:match(vim.pesc(last_part) .. ".*")
        end, completions)
    end

    vim.ui.input({
        prompt = "Run command in " .. cwd .. ": ",
        completion = "customlist,v:lua._shell_complete",
        -- Optional: Add a default value or history
        default = vim.g.last_shell_command or "",
    }, function(input)
            if input and input ~= "" then
                vim.g.last_shell_command = input -- Store for next time
                vim.cmd('!' .. input)
                vim.notify("Executed: " .. input)
            end
        end)

    _G._shell_complete = function(_, line, pos)
        return complete_shell(line:sub(1, pos), line, pos)
    end
end


return M

