-- ============
-- Autocommands
-- ============

vim.cmd([[
  augroup _format_on_save
    autocmd!
    autocmd BufWritePre,FileWritePre * execute ':Format'
  augroup END
]])
