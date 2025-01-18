return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local options = {
        styles = {
          comments = "italic",
          keywords = "bold",
        },
        inverse = {
          search = true,
        },
      }
      local palettes = {
        carbonfox = {
          bg1 = "#000000",
          bg2 = "#0a0a0a",
          comment = "#a5afc2",
        },
      }
      local specs = {}
      local groups = {}
      require("nightfox").setup({
        options = options,
        palettes = palettes,
        specs = specs,
        groups = groups,
      })
      vim.cmd.colorscheme("carbonfox")
    end,
  },
}
