-- # ファイルタイプの設定

-- 必須の設定
vim.cmd([[
    filetype plugin indent on
    syntax enable
]])

-- 自動コマンド設定
local autocmd = vim.api.nvim_create_autocmd

-- ファイルタイプごとのタブ設定
autocmd("FileType",
    { pattern = "python", command = "setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab" }
    )
autocmd("FileType",
    { pattern = "javascript", command = "setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab" }
    )
autocmd("FileType",
    { pattern = "javascriptreact", command = "setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab" }
    )
autocmd("FileType",
    { pattern = {"html", "css", "markdown", "htmldjango"}, command = "setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab" }
)

-- ファイル読み込み時と新規作成時のFileType設定
autocmd({"BufRead", "BufNewFile"},
    { pattern = ".*\\.js$", command = "set filetype=javascriptreact" }
    )
autocmd({"BufRead", "BufNewFile"},
    { pattern = ".*\\.jsx$", command = "set filetype=javascriptreact" }
    )
autocmd({"BufRead", "BufNewFile"},
    { pattern = ".*\\.txt$", command = "set filetype=text" }
    )
autocmd({"BufRead", "BufNewFile"},
    { pattern = ".*\\.html$", command = "set filetype=htmldjango" }
    )
autocmd({"BufRead", "BufNewFile"},
    { pattern = ".*\\.{md,mdwn,mkd,mkdn,mark*}$", command = "set filetype=markdown" }
)
