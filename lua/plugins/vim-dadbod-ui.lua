return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    {
      "tpope/vim-dotenv",
      event = "VimEnter",
      config = function()
        vim.cmd(":Dotenv " .. vim.fn.stdpath("config") .. "/.databases")
      end,
    },
  },
  init = function()
    local data_path = "~/.local/share/db_ui"
    vim.g.db_ui_save_location = data_path
    vim.g.db_ui_tmp_query_location = data_path .. "/tmp"

    vim.g.db_ui_use_nerd_fonts = true
    vim.g.db_ui_show_database_icon = true

    vim.g.db_ui_execute_on_save = false
  end,
}
