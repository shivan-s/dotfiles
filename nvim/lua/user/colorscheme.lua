seoul_command = [[
  let g:seoul256_background = 233
  let g:seoul256_light_background = 256
  colo seoul256
  " colo seoul256-light
  ]]

local status_ok, _ = pcall(vim.cmd, seoul_command)

if not status_ok then
  vim.notify("Seoul256 Not Found!")
  return
end
