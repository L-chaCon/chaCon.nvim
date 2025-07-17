return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local ivy_pickers = {
      "find_files",
      "diagnostics",
      "live_grep",
      "grep_string",
      "lsp_references",
    }

    for _, picker in ipairs(ivy_pickers) do
      opts.pickers[picker] = opts.pickers[picker] or {}
      opts.pickers[picker].theme = "ivy"
    end
  end,
}
