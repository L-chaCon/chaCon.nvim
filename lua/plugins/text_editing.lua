return {
  -- PARA COMMENTAR CODIGO
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  -- MARKDOWN
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()

      vim.keymap.set("n", "<leader>pv", ":MarkdownPreview<CR>", { desc = "Preview Archivos Marckdown" })
      vim.keymap.set("n", "<leader>ps", ":MarkdownPreviewStop<CR>", { desc = "Detener Preview Marckdown" })
    end,
  },
}
