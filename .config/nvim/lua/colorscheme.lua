-- True colorを設定

-- [sytax](http://cohama.hateblo.jp/entry/2013/08/11/020849)
-- colorschemeの設定前に書くこと
-- ターミナルでTrue colorを有効にする
-- カラースキーム適用前にハイライト設定を変更するためのグループを作成

local colorschemeGroup = vim.api.nvim_create_augroup('ColorSchemeOverrides', { clear = true })

local api = vim.api
local function set_highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- 色の設定を変更するautocmd
api.nvim_create_autocmd('ColorScheme', {
    group = highlightIdeographicSpaceGroup,
    pattern = '*',
    callback = function()
        vim.api.nvim_set_hl(0, 'IdeographicSpace', {bg='Red', underline=true})
    end,
})


-- ハイライト設定
vim.api.nvim_create_autocmd('ColorScheme', {
    group = colorschemeGroup,
    pattern = '*',
    callback = function()
        set_highlight('LineNr', {fg = '#F8F8F2'})  -- 前景色を設定
        set_highlight('CursorLine', {bg = 'grey90'})  -- 背景色を設定
        set_highlight('CursorLineNr', {fg = 'yellow', bg = 'grey90'})
        set_highlight('Comment', {fg = 'yellow'})
        set_highlight('Folded', {fg = 'blue', bold = true})
        set_highlight('Visual', {bg = '#16dd00', fg = 'white'})
    end,
})


-- True colorを有効にする
vim.opt.termguicolors = true

-- カラースキームの適用
vim.cmd('colorscheme molokai')

-- カーソルの設定
vim.opt.guicursor = 'n-v-c-ci-i-sm:ver10,r-cr:block'

-- カラースキーム適用前にハイライト設定を変更するためのグループを作成
local colorschemeGroup = vim.api.nvim_create_augroup('ColorSchemeOverrides', { clear = true })

-- ハイライトの設定関数
local function set_highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- カラースキーム適用時にカスタムのハイライト設定を行う
vim.api.nvim_create_autocmd('ColorScheme', {
    group = colorschemeGroup,
    pattern = '*',
    callback = function()
        -- PHP
        set_highlight('phpStorageClass', {fg = '#f92672', ctermfg = 199})

        -- Markdown
        set_highlight('htmlH1', {fg = '#F92672', ctermfg = 199, bold = true})
        set_highlight('htmlH2', {fg = '#A6E22E', ctermfg = 118, bold = true})
        set_highlight('htmlH3', {fg = '#E6DB74', ctermfg = 144})
        set_highlight('htmlBold', {fg = '#F92672', ctermfg = 197, bold = true})
        set_highlight('LineNr', {fg = '#F8F8F2', ctermfg = 252})
        set_highlight('mkdUrl', {fg = '#66D9EF', ctermfg = 81})
        set_highlight('mkdCode', {fg = '#66D9EF', ctermfg = 152})

        -- Visual
        set_highlight('Visual', {fg = 250, bg = 36, guibg = '#16dd00'})
    end,
})


