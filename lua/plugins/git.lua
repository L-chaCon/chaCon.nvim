return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>", { desc = "[G]it [A]dd [A]ll" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "[G]it [P]review Changes" })
      vim.keymap.set(
        "n",
        "<leader>gb",
        ":Gitsigns toggle_current_line_blame<CR>",
        { desc = "Display line [G]it [B]lame" }
      )
    end,
  },
}
