return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Ensure debugpy is installed
      opts.ensure_installed = { "python" }
      opts.automatic_setup = true

      -- Custom adapter/config for Python
      local dap = require("dap")

      -- Adapter: debugpy server
      dap.adapters.python = {
        type = "server",
        host = "127.0.0.1",
        port = 5678, -- overridden by config
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "attach",
          name = "Attach to python :5678",
          connect = { host = "127.0.0.1", port = 5678 },
          pathMappings = {
            { localRoot = vim.fn.getcwd(), remoteRoot = "/app" },
          },
        },
      }
    end,
  },
}
