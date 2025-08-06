return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    -- NOTE: My databases are loaded with dotenv
    {
      "tpope/vim-dotenv",
      event = "VimEnter",
      config = function()
        vim.cmd(":Dotenv " .. vim.fn.stdpath("config") .. "/.databases")
      end,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_execute_on_save = 0
    vim.keymap.set("n", "<leader>md", ":DBUI<CR>", { desc = "Databases UI", silent = true })
    vim.keymap.set("n", "<leader>mt", ":DBUIToggle<CR>", { desc = "Toggle DB", silent = true })
    vim.keymap.set("n", "<leader>mi", ":DBUILastQueryInfo<CR>", { desc = "Info On Last Query", silent = true })
    -- vim.g.dbs = { { name = "some_name", url = "some_url" } }
  end,
}
