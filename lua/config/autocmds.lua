-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Theme functions
local function get_macos_appearance()
  local success, handle = pcall(io.popen, "defaults read -g AppleInterfaceStyle 2>/dev/null")
  if not success then
    return "light"
  end
  local result = handle:read("*a")
  handle:close()
  return result:match("Dark") and "dark" or "light"
end

local function apply_theme(appearance)
  if appearance == "dark" then
    vim.o.background = "dark"
    vim.cmd.colorscheme("carbonfox")
  else
    vim.o.background = "light"
    vim.cmd.colorscheme("dayfox")
  end
end

-- Commands
vim.api.nvim_create_user_command("SyncTheme", function()
  local appearance = get_macos_appearance()
  apply_theme(appearance)
end, {})

vim.api.nvim_create_user_command("ToggleTheme", function()
  if vim.o.background == "dark" then
    apply_theme("light")
  else
    apply_theme("dark")
  end
end, {})

-- QFix list
vim.api.nvim_create_user_command("QFRemoveCurrent", function()
  local qf = vim.fn.getqflist({ idx = 0, items = 0 })

  -- No quickfix list or invalid index
  if not qf.items or #qf.items == 0 or qf.idx == 0 then
    return
  end

  -- Remove current entry (idx is 1-based)
  table.remove(qf.items, qf.idx)

  -- Replace quickfix list
  vim.fn.setqflist({}, "r", {
    items = qf.items,
    idx = math.min(qf.idx, #qf.items),
  })
end, {})
