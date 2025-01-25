-- ====================<<< General >>>==============================


-- Path
-- vim.opt.python_host_prog = expand('~/.pyenv/versions/2.7.17/bin/python')
-- Neovim3が使うpython3のパス
vim.g.python3_host_prog = vim.fn.expand('~/.pyenv/versions/3.11.9/bin/python')

-- EOLを自動追加
vim.opt.fixeol = true

-- vim.opt.mapleader = "\,"
-- vim.opt.mapleader = "\<SPACE>"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileencoding = "utf-8"
-- Indent
vim.opt.backspace = "indent,eol,start" -- backspaceを有効に
vim.opt.expandtab = true               -- タブの代わりに空白文字を指定する
vim.opt.smartindent = true             -- オートインデント
vim.opt.autoindent = true              -- 新しい行のインデントを現在行と同じにする
vim.opt.tabstop = 2                    -- インデントをスペース2つ分に設定
vim.opt.shiftwidth = 2                 -- 自動インデントでずれる幅
vim.opt.softtabstop = 2                -- 連続した空白に対してスペースがずれる幅

-- VisualInfo
vim.opt.number = true                  -- 行番号を表示する
-- vim.opt.cursorline = true           -- カーソルラインに色を付ける 重くなるので無効化
vim.opt.wrap = false                   -- 折り返しを無効にする
vim.opt.showmatch = true               -- 閉括弧が入力された時、対応する括弧を強調する
vim.opt.smarttab = true                -- 新しい行を作った時に高度な自動インデントを行う
vim.opt.hidden = true                  -- 変更中のファイルでも、保存しないで他のファイルを表示する
vim.opt.incsearch = true               -- インクリメンタルサーチを行う
vim.opt.ignorecase = true              -- 大文字/小文字の区別なく検索する
vim.opt.smartcase = true               -- 検索文字列に大文字が含
vim.opt.wrapscan = true                -- 検索時に最後まで行ったら最初に戻る
vim.opt.hlsearch = true                -- 検索文字列をハイライトする
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.fixendofline = false           -- Last Breaklineを自動で追加しない
vim.opt.list = true                    -- TAB,EOFなどを可視化する
vim.opt.listchars = "tab:»-,trail:-,extends:»,precedes:«,nbsp:%"
vim.opt.clipboard:append{'unnamedplus'} -- クリップボード連携
vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f\\ \\ %l%m,%f"  -- grep検索
vim.opt.grepprg = "grep -nh"
vim.opt.path:append("**")             -- find検索
-- -----Backup and Swap-----
vim.opt.directory = os.getenv("HOME") .. "/.vimbackup"
vim.opt.backupdir = os.getenv("HOME") .. "/.vimbackup"

-- api を vim.api からロード
local api = vim.api
-- 全角スペースを可視化するためのグループを作成
local highlightIdeographicSpaceGroup = api.nvim_create_augroup('highlightIdeographicSpace', { clear = true })

-- Vimが起動した時、またはウィンドウに入った時に全角スペースのハイライトマッチングを設定
api.nvim_create_autocmd({'VimEnter', 'WinEnter'}, {
    group = highlightIdeographicSpaceGroup,
    pattern = '*',
    callback = function()
        vim.fn.matchadd('IdeographicSpace', '　')
    end,
})

-- w!! でスーパーユーザーとして保存
vim.cmd([[cmap w!! w !sudo tee > /dev/null %]])


-- タグジャンプ
local root_dir = vim.fn.system("git rev-parse --show-toplevel")
local tags = root_dir:sub(1, -2) .. '/tags'
vim.opt.tags = tags
vim.keymap.set('n', '<C-[>', ':pop<CR>')

-- ### lua ファイルの読み込み
require("colorscheme")
require("keymap")
require("syntaxinfo")
require("load-dein")
require("filetype")

