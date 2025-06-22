return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.comment")

    -- NOTE: This is for `code-companion`
    local diff = require("mini.diff")
    diff.setup({
      -- Disabled by default
      source = diff.gen_source.none(),
    })
  end,
}
