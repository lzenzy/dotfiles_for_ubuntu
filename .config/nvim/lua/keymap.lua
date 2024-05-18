-- # Keymap settings

-- -----Operation-----
vim.keymap.set('v', 'v', '<Plug>(expand_region_expand)')
vim.keymap.set('v', '<C-v>', '<Plug>(expand_region_shrink)')
vim.keymap.set('v', 's', '//e<C-r>=&selection=="exclusive" and "+1" or ""<CR><CR>:<C-u>call histdel("search",-1)<Bar>let @/=histget("search",-1)<CR>gv')
vim.keymap.set('o', 's', ':normal vs<CR>')
vim.api.nvim_create_autocmd("InsertLeave", {command = "set nopaste"})

-- コマンドラインモードのキーバインド
local cnoremap_opts = {noremap = true, silent = true}
vim.keymap.set('c', '<C-b>', '<Left>', cnoremap_opts)
vim.keymap.set('c', '<C-f>', '<Right>', cnoremap_opts)
vim.keymap.set('c', '<C-n>', '<Down>', cnoremap_opts)
vim.keymap.set('c', '<C-p>', '<Up>', cnoremap_opts)
vim.keymap.set('c', '<C-a>', '<Home>', cnoremap_opts)
vim.keymap.set('c', '<C-e>', '<End>', cnoremap_opts)
vim.keymap.set('c', '<C-d>', '<Del>', cnoremap_opts)

-- 入力モードのキーバインド
vim.keymap.set('i', '<C-j>', '<Down>', {noremap = true})
vim.keymap.set('i', '<C-k>', '<Up>', {noremap = true})
vim.keymap.set('i', '<C-h>', '<Left>', {noremap = true})
vim.keymap.set('i', '<C-l>', '<Right>', {noremap = true})
vim.keymap.set('i', 'jj', '<Esc>', {noremap = true})
vim.keymap.set('i', 'qq', '<Esc>', {noremap = true})

-- 日本語入力がオンのままでも使えるコマンド
vim.keymap.set('n', 'あ', 'a')
vim.keymap.set('n', 'い', 'i')
vim.keymap.set('n', 'う', 'u')
vim.keymap.set('n', 'お', 'o')

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

-- 検索結果のハイライトをクリア
vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR>', {silent = true})
vim.keymap.set('n', '<C-j><C-j>', ':nohlsearch<CR>', {silent = true})


-- -----Keybind-----
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- sをwindow系prefixに設定
keymap('n', 's', '<Nop>', opts)

-- 水平・垂直分割
keymap('n', 'ss', ':<C-u>sp<CR>', opts)
keymap('n', 'sv', ':<C-u>vs<CR>', opts)

-- 下、上、右、左窓に移動
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sl', '<C-w>l', opts)
keymap('n', 'sh', '<C-w>h', opts)

-- 次に移動
keymap('n', 'sw', '<C-w>w', opts)

-- 窓自体下、上、右、左に移動、回転
keymap('n', 'sJ', '<C-w>J', opts)
keymap('n', 'sK', '<C-w>K', opts)
keymap('n', 'sL', '<C-w>L', opts)
keymap('n', 'sH', '<C-w>H', opts)
keymap('n', 'sr', '<C-w>r', opts)

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ウィンドウサイズ変更のキーバインド設定
keymap('n', 's>', '<C-w>>', opts)
keymap('n', 's<', '<C-w><', opts)
keymap('n', 's+', '<C-w>+', opts)
keymap('n', 's-', '<C-w>-', opts)

-- 縦横最大化⇔戻す
keymap('n', 'so', '<C-w>_<C-w>|', opts)

-- 次、前のタブに切替
keymap('n', 'sn', 'gt', opts)
keymap('n', 'sp', 'gT', opts)

-- 大きさを揃える
keymap('n', 's=', '<C-w>=', opts)
keymap('n', 'sO', '<C-w>=', opts)

-- バッファを切替
keymap('n', 'sN', ':<C-u>bn<CR>', opts)
keymap('n', 'sP', ':<C-u>bp<CR>', opts)

-- タブ新規
keymap('n', 'st', ':<C-u>tabnew<CR>', opts)
-- タブ一覧 (Uniteプラグインの代わりに必要なコマンドを記述)
keymap('n', 'sT', ':<C-u>tabs<CR>', opts)
-- タブ閉じる
keymap('n', 'sx', ':<C-u>tabclose<CR>', opts)

-- s1〜s9でタブ移動
for n = 1, 9 do
    keymap('n', 's' .. n, ':<C-u>tabnext ' .. n .. '<CR>', opts)
end

-- viウィンドウを閉じる
keymap('n', 'sq', ':<C-u>q<CR>', opts)
-- バッファを閉じる
keymap('n', 'sQ', ':<C-u>bd<CR>', opts)


