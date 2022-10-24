local null_ls = require("null-ls")
-- local prettier = require("prettier")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
  },

  on_attach = function(client, bufnr)
    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  end,
})
