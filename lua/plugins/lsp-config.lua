return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({})
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LUA
          "lua_ls",          --LSP
          "stylua",          --FORMATTER
          --PYTON,
          "jedi-language-server", --LSP
          "black",           --FORMATTER
          "isort",           --FORMATTER
          -- MARCKDOWN
          "mdformat",
        },
        auto_update = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- LENGUAJES INSTALADO LUA
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- CONFIGURACION LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover LSP" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
    end,
  },
}
