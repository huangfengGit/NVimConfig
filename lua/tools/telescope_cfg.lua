-- local telescope = require "telescope"
-- local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    -- prompt_prefix = "🔭 ",
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    -- theme = "",
    layout_config = {
        horizontal = {prompt_position = "bottom", results_width = 1},
        vertical = {mirror = false}
    },
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0,

    -- file_previewer = nil,
    -- grep_previewer = require("telescope.p reviewers").vim_buffer_vimgrep
    --     .new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist
    --     .new,
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {"absolute"},
    file_ignore_patterns = { "node_modules","png","meta" },
    borderchars = {
        "─", "│", "─", "│", "╭", "╮", "╯", "╰"
    },
    color_devicons = true,
    use_less = false,
    -- set_env = {["COLORTERM"] = "solarized"},
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<A-j>"] =require('telescope.actions').move_selection_next,
        ["<A-k>"] =require('telescope.actions').move_selection_previous
        -- [ "<C-p>" ] ="<A-k>"
      },
    }
  },
  pickers = {
      -- ignore_patterns = {"*.git/*", "*/tmp/*","*.png/*"}
      find_files = {
        -- theme = "dropdown",
      }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
  project = {
    base_dirs = {
      {'F:\\Rubix_work', max_depth = 8},
      -- {'F:\\Rubix_work',
      -- {'~/dev/src2'},
      -- {'F:\\Rubix_work', max_depth = 4},
      -- {path = '~/dev/src4'},
      -- {path = '~/dev/src5', max_depth = 2},
    },
    hidden_files = true -- default: false
  }
}