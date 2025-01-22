-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.minianimate_disable = true
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.g.lazyvim_picker = "fzf"
local opt = vim.opt
opt.spelllang = "en,cjk"
opt.spelloptions = "camel"
opt.wrap = true
opt.list = true
opt.listchars = { space = "·" }
opt.scrolloff = 5
opt.indentexpr = ""
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = true
opt.foldlevelstart = 99
opt.clipboard = ""
