return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-symbols.nvim",
  },
  keys = {
    { "<leader>si", "<cmd>Telescope symbols<cr>", desc = "Icons" },
  },
  opts = function(_, opts)
    local ivy_pickers = {
      "find_files",
      "diagnostics",
      "live_grep",
      "grep_string",
      "lsp_references",
    }

    local cursor_pickers = {
      "symbols",
    }

    for _, picker in ipairs(ivy_pickers) do
      opts.pickers[picker] = opts.pickers[picker] or {}
      opts.pickers[picker].theme = "ivy"
    end

    for _, picker in ipairs(cursor_pickers) do
      opts.pickers[picker] = opts.pickers[picker] or {}
      opts.pickers[picker].theme = "cursor"
    end
  end,
}
