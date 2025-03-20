local M = {}

function M.test()
    local cwd = vim.fn.getcwd()

    -- Prompt the user to enter a custom command
    vim.ui.input({
        prompt = "Enter makeprg command in " .. cwd .. ": " 
    }, function(input)
            if input and input ~= "" then
                vim.o.makeprg = input
                vim.notify("makeprg set to: " .. input)
        end
    end)
end

return M

