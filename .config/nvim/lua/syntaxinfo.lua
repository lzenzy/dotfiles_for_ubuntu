-- SyntaxInfoコマンドをLuaで定義
local function get_syn_id(transparent)
    local synid = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1)
    return transparent == 1 and vim.fn.synIDtrans(synid) or synid
end

local function get_syn_attr(synid)
    return {
        name = vim.fn.synIDattr(synid, "name"),
        ctermfg = vim.fn.synIDattr(synid, "fg", "cterm"),
        ctermbg = vim.fn.synIDattr(synid, "bg", "cterm"),
        guifg = vim.fn.synIDattr(synid, "fg", "gui"),
        guibg = vim.fn.synIDattr(synid, "bg", "gui"),
    }
end

local function get_syn_info()
    local baseSyn = get_syn_attr(get_syn_id(0))
    print(string.format("name: %s ctermfg: %s ctermbg: %s guifg: %s guibg: %s",
        baseSyn.name, baseSyn.ctermfg, baseSyn.ctermbg, baseSyn.guifg, baseSyn.guibg))
    local linkedSyn = get_syn_attr(get_syn_id(1))
    print("link to")
    print(string.format("name: %s ctermfg: %s ctermbg: %s guifg: %s guibg: %s",
        linkedSyn.name, linkedSyn.ctermfg, linkedSyn.ctermbg, linkedSyn.guifg, linkedSyn.guibg))
end

vim.api.nvim_create_user_command("SyntaxInfo", get_syn_info, {})
