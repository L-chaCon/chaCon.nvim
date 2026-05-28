-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

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
