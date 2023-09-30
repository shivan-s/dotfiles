local status_ok, magma = pcall(require, "magma-nvim")
if not status_ok then
  return
end

magma.setup({})
