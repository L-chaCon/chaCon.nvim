return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    local ivy_pickers = { "files", "grep", "grep_word", "git_files", "recent" }

    for _, picker in ipairs(ivy_pickers) do
      opts.picker.sources[picker] = {
        layout = { preset = "ivy" },
      }
    end

    return opts
  end,
}
