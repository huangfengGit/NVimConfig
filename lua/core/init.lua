
local basic_setting = function()
    -- vim.cmd('set termguicolors')
    -- vim.cmd("let mapleader = \'\\<Space>\'")
    vim.cmd('set number')
    vim.cmd('set relativenumber')
    
    vim.cmd('set cursorline')


    -- 可是使用滚轮
    vim.cmd('set mouse=a') 
    -- tab 设置
    vim.cmd('set noexpandtab')
    vim.cmd('set sw=4')
    vim.cmd('set tabstop=4')
    vim.cmd('set softtabstop=4')
    -- 文件格式
    vim.o.fileencoding='utf-8'
    -- 光标上下保留行数
    vim.o.scrolloff=8
    vim.o.sidescrolloff=8
    -- set signcolumn=yes
    vim.o.signcolumn='yes'
    -- 右侧参考线
    vim.o.signcolumn='yes'
    vim.o.colorcolumn='100'

    vim.cmd('set foldmethod=indent')
    vim.cmd('set foldlevelstart=99')
end

local key_map = function()
    vim.g.mapleader =" "
    -- vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
    -- vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
    vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true})

    vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>:bnext<cr>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>:bprevious<cr>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<C-w>", "<cmd>:bdelet<cr>", {noremap = true})

    vim.api.nvim_set_keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',{noremap = true})
    vim.api.nvim_set_keymap('n','<leader>fs','<cmd>Telescope grep_string<cr>',{noremap = true})
    vim.api.nvim_set_keymap('n','<leader>fp',":lua require'telescope'.extensions.project.project{}<CR>",{noremap = true})
    vim.api.nvim_set_keymap('n','<leader>fo',":lua require'telescope.builtin'.lsp_document_symbols()<CR>",{noremap = true})

    vim.api.nvim_set_keymap('n','<C-s>',"<cmd>:w<cr>",{silent = true})
    vim.api.nvim_set_keymap('i','<C-s>',"<cmd>:w<cr>",{silent = true})
    vim.api.nvim_set_keymap('n','<C-q>',"<cmd>:q<cr>",{noremap = true})
    vim.api.nvim_set_keymap('i','<C-q>',"<cmd>:q<cr>",{noremap = true})

    vim.api.nvim_set_keymap('n','<leader>b',"<cmd>:NvimTreeToggle<cr>",{noremap = true})

    vim.api.nvim_set_keymap('n','<leader>vsp',"<cmd>:vsp<cr>",{noremap = true})
    vim.api.nvim_set_keymap('n','<leader>sp',"<cmd>:sp<cr>",{noremap = true})
    vim.api.nvim_set_keymap('n','<A-h>',"<cmd>:wincmd h<cr>",{noremap = true})
    vim.api.nvim_set_keymap('n','<A-l>',"<cmd>:wincmd l<cr>",{noremap = true})
    vim.api.nvim_set_keymap('n','<A-k>',"<cmd>:wincmd k<cr>",{noremap = true})
    vim.api.nvim_set_keymap('n','<A-j>',"<cmd>:wincmd j<cr>",{noremap = true})


    vim.api.nvim_set_keymap('n','<leader>f',"<Plug>(prettier-format)",{noremap = true})
end

local setNeovide = function()
    -- if (vim.g.neovide_refresh_rate) then
    --     print(1111)
    -- vim.g.neovide_refresh_rate = 140
    -- vim.g.neovide_fullscreen = "v:true"
    vim.g.neovide_cursor_animation_length=0.05
    vim.g.neovide_transparency = "0.8"
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
    -- end
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
    require('tools.toggleterm_cfg')
    require('tools.telescope_cfg')
    require('tools.prettier_cfg')
    require('tools.indent_cfg')
    require('tools.bufferline_cfg')
    require('tools.pears_cfg')
    require('tools.nvimTree_cfg')
    require('tools.gitsigns_cfg')
    require('tools.cursor_cfg')
    require('tools.prettier_cfg')
    require('tools.todo_cfg')
    -- require('lsp.tslsp')
    -- require('tools.volar_cfg')

    require('core.options')
    vim.cmd('syntax enable')

    -- vim.cmd('colorscheme solarized')
    -- vim.cmd('colorscheme gruvbox')
    -- vim.cmd('set background=light')
    -- vim.cmd('set background=dark')
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
    -- vim.cmd([[colorscheme solarized]])
    vim.cmd('set guifont=Hack\\ Nerd\\ Font\\ Mono')
    -- vim.g.neovide_cursor_vfx_mode = "railgun"
    -- vim.g.neovide_cursor_animation_length="0.05"
    vim.cmd('set guifont=:h20')
    key_map()
    setNeovide()
    vim.g.dashboard_default_executive = 'telescope'

    -- multCursor_config()
    dashboard_config()
end

load_core()



    -- vim.g.solarized_termcolors= 16
    -- vim.g.solarized_termcolors= 256


    -- vim.g.solarized_degrade = 0
    -- vim.g.solarized_degrade = 1 

    -- vim.g.solarized_bold = 1 
    -- vim.g.solarized_bold = 0 

    -- vim.g.solarized_underline = 1
    -- vim.g.solarized_underline = 0

    -- vim.g.solarized_italic = 1
    -- vim.g.solarized_italic = 0

    -- vim.g.solarized_contrast = "normal"
    -- vim.g.solarized_contrast = "high" 
    -- vim.g.solarized_contrast = "low" 

    -- vim.g.solarized_visibility= "normal"
    -- vim.g.solarized_visibility= "high"
    -- vim.g.solarized_visibility= "low"