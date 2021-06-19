local npairs = require('nvim-autopairs')

_G.npairs = npairs

npairs.setup({
    enable_afterquote = true,
})
local data = {
    {
        name = 'move end wise after quote ',
        filepath = './tests/endwise/init.lua',
        filetype = 'lua',
        linenr = 5,
        key = [[<M-e>]],
        before = [[const abc=(|"test",data ]],
        after = [[const abc=(|"test"),data ]],
    },
    {
        name = 'move end wise after quote ',
        filepath = './tests/endwise/init.lua',
        filetype = 'lua',
        linenr = 5,
        key = [[<M-e>]],
        before = [[const abc=(|"test"),data ]],
        after = [[const abc=(|"test",data) ]],
    },
    {
        name = 'move end wise after quote ',
        filepath = './tests/endwise/init.lua',
        filetype = 'lua',
        linenr = 5,
        key = [[<M-e>]],
        before = [[const abc=(|"test",data),dadas ]],
        after = [[const abc=(|"test",data,dadas) ]],
    },
    {
        name = 'move end wise after quote ',
        filepath = './tests/endwise/init.lua',
        filetype = 'lua',
        linenr = 5,
        key = [[<M-e>]],
        before = [[Plug {(|'dsfdsa',)  on = 'aaa'}  ]],
        after = [[Plug {('dsfdsa',  on = 'aaa')}  ]],
    },
}

local run_data = _G.Test_filter(data)

local _, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
_G.TU = ts_utils

describe('[endwise tag]', function()
    _G.Test_withfile(run_data, {})
end)
