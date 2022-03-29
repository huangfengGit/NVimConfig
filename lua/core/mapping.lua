local opt = {
    noremap = true,
    silent = true
}

local mapbuf = vim.api.nvim_set_keymap

local key_map = function()
    vim.g.mapleader =" "
    mapbuf("i", "jj", "<Esc>", {noremap = true})

    mapbuf("n", "<Tab>", "<cmd>:bnext<cr>", {noremap = true})
    mapbuf("n", "<S-Tab>", "<cmd>:bprevious<cr>", {noremap = true})
    mapbuf("n", "<C-w>", "<cmd>:bdelet<cr>", {noremap = true})

    mapbuf('n','<leader>ff','<cmd>Telescope find_files<cr>',{noremap = true})
    mapbuf('n','<leader>fs','<cmd>Telescope grep_string<cr>',{noremap = true})
    mapbuf('n','<leader>fp',":lua require'telescope'.extensions.project.project{}<CR>",{noremap = true})
    mapbuf('n','<leader>fo',":lua require'telescope.builtin'.lsp_document_symbols()<CR>",{noremap = true})

    mapbuf('n','<C-s>',"<cmd>:w<cr>",{silent = true})
    mapbuf('i','<C-s>',"<cmd>:w<cr>",{silent = true})
    mapbuf('n','<C-q>',"<cmd>:q<cr>",{noremap = true})
    mapbuf('i','<C-q>',"<cmd>:q<cr>",{noremap = true})

    mapbuf('n','<leader>b',"<cmd>:NvimTreeToggle<cr>",{noremap = true})

    mapbuf('n','<leader>vsp',"<cmd>:vsp<cr>",{noremap = true})
    mapbuf('n','<leader>sp',"<cmd>:sp<cr>",{noremap = true})
    mapbuf('n','<A-h>',"<cmd>:wincmd h<cr>",{noremap = true})
    mapbuf('n','<A-l>',"<cmd>:wincmd l<cr>",{noremap = true})
    mapbuf('n','<A-k>',"<cmd>:wincmd k<cr>",{noremap = true})
    mapbuf('n','<A-j>',"<cmd>:wincmd j<cr>",{noremap = true})

    -- rename 变量
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    -- code action 执行一些操作，比如 import miss delete unuse
    mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
    -- go xx
    -- 跳转 定义
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    -- 显示使用
    mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
    -- mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    -- 定义关系 使用关系
    mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    -- 定义关系 使用关系 使用到的地方
    mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
    -- diagnostic
    mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
    mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)

end
key_map()