return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      keywords = { chaCon = { icon = "䷁", color = "chaCon" }, TAILS = { icon = "󰩃", color = "tails" } },
      colors = { chaCon = { "#25BE6A" }, tails = { "#029ffa" } },
    },
    keys = {
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
      { "<leader>xt", "<cmd>Trouble todo<cr>", desc = "Trouble todo" },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
}
