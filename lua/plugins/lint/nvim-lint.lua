return {
  "mfussenegger/nvim-lint",
  event = "BufWritePost",
  config = function()
    require("lint").linters_by_ft = {
      -- FIX: ESTOY HACIENDO ESTO AHORA EN CONFORT
      -- python = {
      --   "ruff",
      -- },
      sql = {
        "sqlfluff",
      },
    }
    -- FIX: ESTA EN CONFORT
    -- correr al guardar
    -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    --   group = vim.api.nvim_create_augroup("PythonLint", { clear = true }),
    --   pattern = { "*.py" },
    --   callback = function()
    --     require("lint").try_lint()
    --   end,
    -- })
    vim.api.nvim_create_autocmd({ "BufWritePost", "FileType" }, {
      group = vim.api.nvim_create_augroup("SQLLint", { clear = true }),
      pattern = "sql",
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
