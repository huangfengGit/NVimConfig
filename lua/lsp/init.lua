require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
-- require("lspconfig").tsserver.setup {}
require("lspconfig").volar.setup {
    filetypes = { 'vue', 'typescript' }
}


require("lsp.nvim-cmp")
