return {
  {

    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>=",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()

    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type conform.setupOpts
    opts = {

      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        json = { "jq" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
      -- Customize formatters
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        shfmt = {
          prepend_args = { "-i", "4" },
        },
        jq = { "--sort-keys", "--indent", "2" },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          local ft = vim.o.filetype
          if ft == "lua" then
            vim.o.tabstop = 2
            vim.o.shiftwidth = 2
            vim.o.softtabstop = 2
          elseif ft == "json" then
            vim.o.tabstop = 2
            vim.o.shiftwidth = 2
            vim.o.softtabstop = 2
          elseif ft == "python" then
            vim.o.tabstop = 4
            vim.o.shiftwidth = 4
            vim.o.softtabstop = 4
          elseif ft == "rust" then
            vim.o.tabstop = 4
            vim.o.shiftwidth = 4
            vim.o.softtabstop = 4
          elseif ft == "terraform" then
            vim.o.tabstop = 2
            vim.o.shiftwidth = 2
            vim.o.softtabstop = 2
            -- else
            --   vim.o.tabstop = 4
            --   vim.o.shiftwidth = 4
            --   vim.o.softtabstop = 4
          end
        end,
      })
    end,
  },
}
