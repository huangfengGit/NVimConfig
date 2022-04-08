local neovide_config = function()
    
    -- vim.cmd([[set guifont=Hack\\ Nerd\\ Font\\ Mono:h20]])
    -- vim.cmd('set guifont=:h20')
	-- vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h12]])
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_no_idle = true
	vim.g.neovide_cursor_animation_length = 0.03
	vim.g.neovide_cursor_trail_length = 0.05
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_speed = 20.0
	vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local dashboard_config = function()
    vim.g.dashboard_footer_icon = "🐬 "
    vim.g.dashboard_default_executive = "telescope"

    vim.g.dashboard_custom_header = {
        [[              ...  .......          ]],
        [[         ....................       ]],
        [[    ..'........................     ]],
        [[ ...,'.......'.., .........'....    ]],
        [[  .'......,. ;'., '..'.......'.'.   ]],
        [[ .'.,'.''.;..,'.. .  ...'....','..  ]],
        [[..''.'.''''.....        .,'....;'.. ]],
        [[..',.......'. .        ..';'..','...]],
        [[ ....''..  ..        .....;,..','...]],
        [[  . .....           ......,..';,....]],
        [[      .'.         ....  ... ,,'.....]],
        [[      .,..             .....,'..... ]],
        [[     .'''.             ...'......   ]],
        [[     ..'..'.          ... ......    ]],
        [[       . '.'..             ..       ]],
        [[         ......           .         ]],
        [[            ....                    ]]
    }

    vim.g.dashboard_custom_section = {
        find_file = {
            description = {" File find                  comma f f "},
            command = "DashboardFindFile"
        },
        change_colorscheme = {
            description = {" Scheme change              comma s c "},
            command = "DashboardChangeColorscheme"
        },
        find_project = {
            description = {" Project find               comma f p "},
            command = ":lua require'telescope'.extensions.project.project{}"
            -- command = "Telescope project"
        },
        -- find_frecency = {
        --     description = {" File frecency              comma f r "},
        --     command = "Telescope frecency"
        -- },
        -- find_history = {
        --     description = {" File history               comma f e "},
        --     command = "DashboardFindHistory"
        -- },
        -- file_new = {
        --     description = {" File new                   comma f n "},
        --     command = "DashboardNewFile"
        -- },
        -- find_word = {
        --     description = {" Word find                  comma f w "},
        --     command = "DashboardFindWord"
        -- }
    }
end

local multCursor_config = function()
    vim.g.multi_cursor_use_default_mapping=0

    vim.g.multi_cursor_start_word_key      = '<C-d>'
    -- vim.g.multi_cursor_select_all_word_key = '<A-D>'
    -- vim.g.multi_cursor_start_key           = 'g<C-d>'
    -- vim.g.multi_cursor_select_all_key      = 'g<A-d>'
    -- vim.g.multi_cursor_next_key            = '<C-n>'
    -- vim.g.multi_cursor_prev_key            = '<C-p>'
    -- vim.g.multi_cursor_skip_key            = '<C-x>'
    vim.g.multi_cursor_quit_key            = '<Esc>'
end

local load_core = function()
    require('core.plugins')

    require('lsp')
    -- require('tools.toggleterm_cfg')
    require('tools.FTerm_cfg')
    require('tools.telescope_cfg')
    require('tools.indent_cfg')
    require('tools.bufferline_cfg')
    require('tools.pears_cfg')
    require('tools.nvimTree_cfg')
    require('tools.gitsigns_cfg')
    require('tools.cursor_cfg')
    require('tools.todo_cfg')
    require('tools.nullls_cfg')

    require('core.options')
    vim.cmd('syntax enable')

    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
    -- neovide_config()
    vim.g.dashboard_default_executive = 'telescope'
    dashboard_config()
    
    require('core.mapping')
end
load_core()

