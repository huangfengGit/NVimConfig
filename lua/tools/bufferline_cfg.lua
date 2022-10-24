-- vim.g.solarized_italic_comments = true
-- vim.g.solarized_italic_keywords = true
-- vim.g.solarized_italic_functions = true
-- vim.g.solarized_italic_variables = false
-- vim.g.solarized_contrast = true
-- vim.g.solarized_borders = false
-- vim.g.solarized_disable_background = false
-- require('solarized').set()

require("bufferline").setup {
    options = {
        number = "None",
        modified_icon = "●",
        buffer_close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 16,
        show_buffer_close_icons = true,
        show_buffer_kkkkicons = true,
        show_tab_indicators = true,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        separator_style = "thin",
    },
    -- custom_areas = {
    --     right = function()
    --         local result = {}
    --         local seve = vim.diagnostic.severity
    --         local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
    --         local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
    --         local info = #vim.diagnostic.get(0, { severity = seve.INFO })
    --         local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

    --         if error ~= 0 then
    --             table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
    --         end

    --         if warning ~= 0 then
    --             table.insert(result, { text = "  " .. warning, guifg = "#EFB839" })
    --         end

    --         if hint ~= 0 then
    --             table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
    --         end

    --         if info ~= 0 then
    --             table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
    --         end
    --         return result
    --     end,
    -- }
}

require("nvim-gps").setup({
    icons = {
        ["class-name"] = " ", -- Classes and class-like objects
        ["function-name"] = " ", -- Functions
        ["method-name"] = " ", -- Methods (functions inside class-like objects)
        ["container-name"] = '⛶ ', -- Containers (example: lua tables)
        ["tag-name"] = '炙', -- Tags (example: html tags)

    },
    languages = {
        -- You can disable any language individually here
        ["c"] = true,
        ["cpp"] = true,
        ["go"] = true,
        ["java"] = true,
        ["javascript"] = true,
        ["typescript"] = true,
        ["lua"] = true,
        ["python"] = true,
        ["rust"] = true
    },
    separator = " > ",
    print(000000)
})

local gps = require("nvim-gps")

local function gps_content()
    if gps.is_available() then
        return gps.get_location()
    else
        return ""
    end
end

local symbols_outline = {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filetype' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' }
    },
    filetypes = { 'Outline' }
}

require("lualine").setup {
    options = {
        icons_enabled = true,
        -- theme = "solarized_dark",
        theme = "gruvbox_dark",
        disabled_filetypes = {},
        component_separators = "|",
        section_separators = { left = "", right = "" }
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { { "branch" }, { "diff" } },
        lualine_c = {
            { "filename" }, { "lsp_progress" }, { gps_content, cond = gps.is_available }
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { 'nvim_diagnostic' },
                symbols = { error = " ", warn = " ", info = " " }
            }
        },
        lualine_y = { "encoding", "fileformat" }, --"filetype",
        lualine_z = { "progress", "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {
        "quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline
    }
}
