require 'nvim-treesitter.configs'.setup {
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
        opts.on_attach = function(client)
            custom_attach(client)
        end
        opts.settings = {
            Lua = {
                diagnostics = { globals = { "vim" },
                neededFileStatus = {
                    ["codestyle-check"] = "Any",
                    },
                },
                workspace = {
                    library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
					    maxPreload = 100000,
					preloadFileSize = 10000,
				},
				telemetry = { enable = false },
                format = {
                    enable = true,
                    -- Put format options here
                    -- NOTE: the value should be STRING!!
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "2",
                    }
                },
			},
		}
	end,
	["jsonls"] = function(opts)
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end
	end,
	["tsserver"] = function(opts)
		-- Disable `tsserver`'s format
		opts.on_attach = function(client)
			-- print("tsserver on attach")
			client.resolved_capabilities.document_formatting = false
			-- custom_attach(client)
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
	["pyrigth"] = function(opts)
		-- Disable `pyrigth`'s format
		opts.on_attach = function(client)
			-- print("pyright on attach")
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
		opts.settings = {
			gopls = {
				usePlaceholders = true,
				analyses = {
					nilness = true,
					shadow = true,
					unusedparams = true,
					unusewrites = true,
				},
			},
		}
		-- Disable `gopls`'s format
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			custom_attach(client)
		end
	end,
}

return enhance_server_opts
