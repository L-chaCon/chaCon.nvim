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
}
