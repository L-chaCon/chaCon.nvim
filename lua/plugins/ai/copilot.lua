return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = false,
      markdown = true,
      lua = true,
      python = true,
      javascript = true,
    }

    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-j>", "copilot#Accept()", { expr = true, silent = true, replace_keycodes = false })
    vim.keymap.set("i", "<C-k>", "copilot#Dismiss()", { expr = true, silent = true })
    vim.keymap.set("i", "<C-l>", "copilot#Next()", { expr = true, silent = true })
    vim.keymap.set("i", "<C-h>", "copilot#Previous()", { expr = true, silent = true })
    vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot" })
    vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<cr>", { desc = "Enable Copilot" })
  end,
}
