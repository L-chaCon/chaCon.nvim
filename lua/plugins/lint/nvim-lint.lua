return {
  "mfussenegger/nvim-lint",
  event = "BufWritePost",
  config = function()
    require("lint").linters_by_ft = {
      python = {
        "ruff",
      },
    }
    -- correr al guardar
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("PythonLint", { clear = true }),
      pattern = { "*.py" },
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
