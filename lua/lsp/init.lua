local lsp_installer = require "nvim-lsp-installer"
lspConfig = require 'lsp.config'

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
    local opts = {
        -- capabilities = capabilities,
        -- flags = { debounce_text_changes = 500 },
        -- on_attach = function(client)
        --     vim.cmd([[augroup Format]])
        --     vim.cmd([[autocmd! * <buffer>]])
        --     vim.cmd([[autocmd BufWritePost <buffer> Prettier]])
        --     vim.cmd([[augroup END]])
        -- end
    }
    
    if lspConfig[server.name] then
        lspConfig[server.name](opts)
    end
    
    server:setup(opts)
end)


require("lsp.nvim-cmp")