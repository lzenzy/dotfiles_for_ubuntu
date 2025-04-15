-- Dein setup
local dein_dir = vim.fn.stdpath("cache") .. "/dein"
local dein_repo_dir = dein_dir .. "/repos/github.com/Shougo/dein.vim"

if not string.find(vim.o.runtimepath, '/dein.vim') then
  if vim.fn.isdirectory(dein_repo_dir) == 0 then
    vim.fn.system({
      "git", "clone", "https://github.com/Shougo/dein.vim", dein_repo_dir
    })
  end
  vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath
end
-- Load Dein plugins
local dein = require('dein')

-- Initialize Dein once
function init_dein()
  if dein.load_state(dein_dir) then
    dein.begin(dein_dir)

    -- Plugin configuration file path
    -- local script_dir = vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p:h')
    local script_dir = vim.fn.stdpath('config')

    local toml_files = {
      { path = script_dir .. '/toml/dein.toml', lazy = 0 },
      { path = script_dir .. '/toml/ale.toml', lazy = 1 },
      { path = script_dir .. '/toml/denite.toml', lazy = 1 },
      { path = script_dir .. '/toml/dein_lazy.toml', lazy = 1 },
    }

    -- Load TOML files
    for _, toml in ipairs(toml_files) do
      dein.load_toml(toml.path, { lazy = toml.lazy })
    end

    if dein.check_install() then
      dein.install()
    end

    dein.end_()
    dein.save_state()
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = init_dein,
})
