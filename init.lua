-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.colorcolumn = "80"
vim.opt.wrap = true
vim.opt.textwidth = 80
--禁止生产备份文件
vim.opt.backup = false
-- --每个分割窗口行都有独立的状态行
-- vim.opt.laststatus = 2
--忽略node_modules
vim.opt.wildignore:append { '*/node_modules/*' }
