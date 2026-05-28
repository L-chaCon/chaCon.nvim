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

    vim.keymap.set("n", "<leader>fa", function()
      Snacks.picker.files({ ignored = true, hidden = true })
    end, { desc = "Find all files (including ignored)" })

    vim.keymap.set("n", "<leader>sA", function()
      Snacks.picker.grep({ ignored = true, hidden = true })
    end, { desc = "Grep all (including ignored)" })

    return opts
  end,
}
