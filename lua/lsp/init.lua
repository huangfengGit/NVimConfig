local lsp_installer = require "nvim-lsp-installer"
require('lsp.tslsp')

-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- local servers = {
--     tsserver = require 'lsp.tslsp',
--     volar = require 'lsp.vuelsp'
-- }

lsp_installer.on_server_ready(function(server)
    local opts = {} --servers[server.name]
    opts.on_attach = function(_, bufnr)
        local function buf_set_keymap(...) 
            vim.api.nvim_buf_set_keymap(bufnr, ...) 
        end
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        
        require('lsp.defkeybindings').maplsp(buf_set_keymap)
    end
    -- 绑定快捷键
    server:setup(opts)
end)

require("lsp.nvim-cmp")

-- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end