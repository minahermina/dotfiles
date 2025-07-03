-- Global mappings.
vim.keymap.set("n", "<space>a", vim.diagnostic.open_float) 
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
--) Use LspAttach autocommand to only map the following keys
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- vim.keymap.set("n", "<C-k> ", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set("n", "<space>wl", function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>F", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}
-- Setup language servers.
local lspconfig = require "lspconfig"

--[[ lspconfig.clangd.setup {
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    on_attach = vim.lsp.common_on_attach,
    init_options = {
        preferences = {
            disableSuggestions = true,
        }
    }
} ]]

--[[ lspconfig.ts_ls.setup {
    on_attach = vim.lsp.common_on_attach,
    init_options = {
        preferences = {
            disableSuggestions = true,
        }
    }
} ]]

--[[ lspconfig.ltex.setup {
    cmd = { 'ltex-ls' },
    filetypes  = {
        "bib", "gitcommit", "markdown", 
        "org", "plaintex", "rst", 
        "rnoweb", "tex", "pandoc", 
        "quarto", "rmd", "context", 
        "html", "xhtml", "mail",
    },
    on_attach = vim.lsp.common_on_attach,
    root_dir = vim.fn.expand('%:p:h'),
    single_file_support = true
} ]]

local servers = { "jdtls", "rust_analyzer", "clangd", "lua_ls", "pyright", --[[ "ltex" ]] }

--[[ vim.diagnostic.config({
  virtual_text = false,    -- Disable virtual text completely
  signs = false,          -- Keep diagnostic signs in the gutter
  underline = false,      -- Keep underlining issues in the text
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
}) ]]

--[[ for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end ]]
