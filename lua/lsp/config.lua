require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }, 
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}



local function custom_attach(client)
	-- require("lsp_signature").on_attach({
	-- 	bind = true,
	-- 	use_lspsaga = false,
	-- 	floating_window = true,
	-- 	fix_pos = true,
	-- 	hint_enable = true,
	-- 	hi_parameter = "Search",
	-- 	handler_opts = { "double" },
	-- })
	-- require("aerial").on_attach(client)

	if client.resolved_capabilities.document_formatting then
		vim.cmd([[augroup Format]])
		vim.cmd([[autocmd! * <buffer>]])
		vim.cmd([[autocmd BufWritePost <buffer> lua require'modules.completion.formatting'.format()]])
		vim.cmd([[augroup END]])
	end
end

local enhance_server_opts = {
	["sumneko_lua"] = function(opts)
		-- opts.settings = {
		-- 	Lua = {
		-- 		diagnostics = { globals = { "vim" } },
		-- 		workspace = {
		-- 			library = {
		-- 				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
		-- 				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
		-- 			},
		-- 			maxPreload = 100000,
		-- 			preloadFileSize = 10000,
		-- 		},
		-- 		telemetry = { enable = false },
		-- 	},
		-- }
	end,
	["clangd"] = function(opts)
		-- opts.args = {
		-- 	"--background-index",
		-- 	"-std=c++20",
		-- 	"--pch-storage=memory",
		-- 	"--clang-tidy",
		-- 	"--suggest-missing-includes",
		-- }
		-- opts.capabilities.offsetEncoding = { "utf-16" }
		-- opts.single_file_support = true
		-- opts.commands = {
		-- 	ClangdSwitchSourceHeader = {
		-- 		function()
		-- 			switch_source_header_splitcmd(0, "edit")
		-- 		end,
		-- 		description = "Open source/header in current buffer",
		-- 	},
		-- 	ClangdSwitchSourceHeaderVSplit = {
		-- 		function()
		-- 			switch_source_header_splitcmd(0, "vsplit")
		-- 		end,
		-- 		description = "Open source/header in a new vsplit",
		-- 	},
		-- 	ClangdSwitchSourceHeaderSplit = {
		-- 		function()
		-- 			switch_source_header_splitcmd(0, "split")
		-- 		end,
		-- 		description = "Open source/header in a new split",
		-- 	},
		-- }
		-- -- Disable `clangd`'s format
		-- opts.on_attach = function(client)
		-- 	client.resolved_capabilities.document_formatting = false
		-- 	custom_attach(client)
		-- end
	end,
	["jsonls"] = function(opts)
		opts.settings = {
			json = {
				-- Schemas https://www.schemastore.org
				schemas = {
					{
						fileMatch = { "package.json" },
						url = "https://json.schemastore.org/package.json",
					},
					{
						fileMatch = { "tsconfig*.json" },
						url = "https://json.schemastore.org/tsconfig.json",
					},
					{
						fileMatch = {
							".prettierrc",
							".prettierrc.json",
							"prettier.config.json",
						},
						url = "https://json.schemastore.org/prettierrc.json",
					},
					{
						fileMatch = { ".eslintrc", ".eslintrc.json" },
						url = "https://json.schemastore.org/eslintrc.json",
					},
					{
						fileMatch = {
							".babelrc",
							".babelrc.json",
							"babel.config.json",
						},
						url = "https://json.schemastore.org/babelrc.json",
					},
					{
						fileMatch = { "lerna.json" },
						url = "https://json.schemastore.org/lerna.json",
					},
					{
						fileMatch = {
							".stylelintrc",
							".stylelintrc.json",
							"stylelint.config.json",
						},
						url = "http://json.schemastore.org/stylelintrc.json",
					},
					{
						fileMatch = { "/.github/workflows/*" },
						url = "https://json.schemastore.org/github-workflow.json",
					},
				},
			},
		}
	end,
	["tsserver"] = function(opts)
		-- Disable `tsserver`'s format
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			-- custom_attach(client)
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
	["dockerls"] = function(opts)
		-- Disable `dockerls`'s format
		-- opts.on_attach = function(client)
		-- 	client.resolved_capabilities.document_formatting = false
		-- 	custom_attach(client)
		-- end
	end,
	["gopls"] = function(opts)
		-- opts.settings = {
		-- 	gopls = {
		-- 		usePlaceholders = true,
		-- 		analyses = {
		-- 			nilness = true,
		-- 			shadow = true,
		-- 			unusedparams = true,
		-- 			unusewrites = true,
		-- 		},
		-- 	},
		-- }
		-- -- Disable `gopls`'s format
		-- opts.on_attach = function(client)
		-- 	client.resolved_capabilities.document_formatting = false
		-- 	custom_attach(client)
		-- end
	end,
}

return enhance_server_opts