return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    enabled = true,
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
        python = { "ruff_fix", "ruff_format" },
        json = { "jq" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
      -- Customize formatters
      formatters = {
        ruff_fix = {},
        ruff_format = {},
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        shfmt = {
          prepend_args = { "-i", "4" },
        },
        jq = { "--sort-keys", "--indent", "2" },
        sqlfuff = {}, -- TODO: Configurar el formateo, o chacjar como se configura
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      -- Instructions before entering a buffer
      local in_list = vim.tbl_contains
      local two_indent = {
        "lua",
        "json",
        "terraform",
        "sql",
      }
      local four_indent = {
        "python",
        "rust",
        "bash",
      }
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          local ft = vim.o.filetype
          if in_list(two_indent, ft) then
            vim.o.tabstop = 2
            vim.o.shiftwidth = 2
            vim.o.softtabstop = 2
          elseif in_list(four_indent, ft) then
            vim.o.tabstop = 4
            vim.o.shiftwidth = 4
            vim.o.softtabstop = 4
          else
            vim.o.tabstop = 2
            vim.o.shiftwidth = 2
            vim.o.softtabstop = 2
          end
        end,
      })
    end,
  },
}
