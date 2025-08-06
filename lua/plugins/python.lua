return {
  {
    "linux-cultist/venv-selector.nvim",
    keys = function()
      return {
        { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Select Virtual Enviroment" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ruff
      opts.servers.ruff = opts.servers.ruff or {}
      opts.servers.ruff.settings = {
        organizeImports = true,
        format = {
          enable = true,
        },
      }

      -- Pyright
      opts.servers.pyright = opts.servers.pyright or {}
      opts.servers.pyright.settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
            ignore = { "*" },
          },
        },
      }
    end,
  },
}
