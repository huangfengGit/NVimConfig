local fterm = require("FTerm")

fterm.setup({
    border = 'double',
    dimensions  = {
        height = 0.6,
        width = 0.6,
    },
    cmd = "pwsh",
    -- border = 'single',
    hl = 'Normal',
})

local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "lazygit",
    -- cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.__fterm_gitui()
    gitui:toggle()
end