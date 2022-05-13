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

-- prettier.setup({
--   bin = 'prettier', -- or `prettierd`
--   filetypes = {
--     "css",
--     "graphql",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "json",
--     "less",
--     "markdown",
--     "scss",
--     "typescript",
--     "typescriptreact",
--     "yaml",
--   },

--   -- prettier format options (you can use config files too. ex: `.prettierrc`)
--   arrow_parens = "always",
--   bracket_spacing = true,
--   embedded_language_formatting = "auto",
--   end_of_line = "lf",
--   html_whitespace_sensitivity = "css",
--   jsx_bracket_same_line = false,
--   jsx_single_quote = true,
--   print_width = 80,
--   prose_wrap = "preserve",
--   quote_props = "as-needed",
--   semi = true,
--   single_quote = true,
--   tab_width = 4,
--   trailing_comma = "es5",
--   use_tabs = false,
--   vue_indent_script_and_style = false,
-- })
