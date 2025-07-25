return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          local telescope_theme = require("telescope.themes").get_ivy()
          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

          -- Find references for the word under your cursor.
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map("<leader>lD", require("telescope.builtin").lsp_type_definitions, "[L]SP Type [D]efinition")

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map("<leader>lds", require("telescope.builtin").lsp_document_symbols, "[L]SP [D]ocument [S]ymbols")

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[L]SP [W]orkspace [S]ymbols")

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map("K", vim.lsp.buf.hover, "Hover Documentation")

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- Diagnostic keymaps
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local util = require("lspconfig.util")
      local servers = {
        -- PYTHON
        ruff = {
          init_options = {
            settings = {
              lineLength = 79,
              logLevel = "debug",
              exclude = { "**/tests/**" },
              configurationPreference = "filesystemFirst",
            },
          },
        },
        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
              },
            },
          },
        },

        -- GO
        gopls = {},

        -- Rust
        rust_analyzer = {
          filetypes = { "rust" },
          root_dir = util.root_pattern("Cargo.toml"),
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },

        -- LUA
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }
      -- Ensure the servers and tools above are installed
      require("mason").setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- LUA
        "lua_ls", --LSP
        "stylua", --FORMATTER
        --PYTON
        "pyright",
        "ruff", -- LINT/FORMATTER
        -- GO
        "gopls",
        -- RUST
        "rust_analyzer", --LSP
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      ---@diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })

      local log = require("plenary.log").new({
        plugin = "lsp_custom_after", -- Name of the log file
        level = "debug", -- Log level: trace, debug, info, warn, error
        use_console = false,
      })

      for key, value in pairs(servers) do
        if value["after"] then
          log.info("Logging function reference for:", key)
          log.debug("Function reference:", value["after"]) -- Logs the reference
          log.info("Calling the function...")
          value["after"]() -- Call the function
          log.info("Function executed successfully.")
        end
      end
    end,
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     vim.api.nvim_create_autocmd("LspAttach", {
  --       group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  --       callback = function(event)
  --         local map = function(keys, func, desc)
  --           vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
  --         end
  --         local telescope_theme = require("telescope.themes").get_ivy()
  --         map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
  --         map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  --         map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  --         map("<leader>lD", require("telescope.builtin").lsp_type_definitions, "[L]SP Type [D]efinition")
  --         map("<leader>lds", require("telescope.builtin").lsp_document_symbols, "[L]SP [D]ocument [S]ymbols")
  --         map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[L]SP [W]orkspace [S]ymbols")
  --         map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  --         map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  --         map("K", vim.lsp.buf.hover, "Hover Documentation")
  --         -- WARN: This is not Goto Definition, this is Goto Declaration.
  --         --  For example, in C this would take you to the header
  --         map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  --
  --         -- Diagnostic keymaps
  --         vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
  --         vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
  --         vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
  --         vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
  --
  --         -- The following two autocommands are used to highlight references of the
  --         -- word under your cursor when your cursor rests there for a little while.
  --         --    See `:help CursorHold` for information about when this is executed
  --         -- When you move your cursor, the highlights will be cleared (the second autocommand).
  --         local client = vim.lsp.get_client_by_id(event.data.client_id)
  --         if client and client.server_capabilities.documentHighlightProvider then
  --           vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  --             buffer = event.buf,
  --             callback = vim.lsp.buf.document_highlight,
  --           })
  --
  --           vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  --             buffer = event.buf,
  --             callback = vim.lsp.buf.clear_references,
  --           })
  --         end
  --       end,
  --     })
  --
  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  --
  --     local servers = { zls = {} }
  --
  --     local lspcofig = require("lspconfig")
  --
  --     lspcofig.lua_ls.setup({
  --       settings = {
  --         Lua = {
  --           runtime = { version = "LuaJIT" },
  --           workspace = {
  --             checkThirdParty = false,
  --             library = {
  --               "${3rd}/luv/library",
  --               unpack(vim.api.nvim_get_runtime_file("", true)),
  --             },
  --           },
  --           completion = {
  --             callSnippet = "Replace",
  --           },
  --         },
  --       },
  --     })
  --
  --     lspcofig.zls.setup({
  --       -- Server-specific settings. See `:help lspconfig-setup`
  --
  --       -- omit the following line if `zls` is in your PATH
  --       cmd = { "/Users/octavio/.zig/zls-macos-aarch64-0.15.0-dev.254+22fc237c/zls" },
  --       -- There are two ways to set config options:
  --       --   - edit your `zls.json` that applies to any editor that uses ZLS
  --       --   - set in-editor config options with the `settings` field below.
  --       --
  --       -- Further information on how to configure ZLS:
  --       -- https://zigtools.org/zls/configure/
  --       settings = {
  --         zls = {
  --           -- Whether to enable build-on-save diagnostics
  --           --
  --           -- Further information about build-on save:
  --           -- https://zigtools.org/zls/guides/build-on-save/
  --           -- enable_build_on_save = true,
  --
  --           -- Neovim already provides basic syntax highlighting
  --           semantic_tokens = "partial",
  --
  --           -- omit the following line if `zig` is in your PATH
  --           zig_exe_path = "/Users/octavio/.zig/zig-aarch64-macos-0.15.0-dev.905+edf785db0/zig",
  --         },
  --       },
  --     })
  --
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       pattern = { "*.zig", "*.zon" },
  --       callback = function(ev)
  --         vim.lsp.buf.format()
  --       end,
  --     })
  --
  --     -- LOG
  --     local log = require("plenary.log").new({
  --       plugin = "lsp_custom_after",
  --       level = "debug",
  --       use_console = false,
  --     })
  --     for key, value in pairs(servers) do
  --       if value["after"] then
  --         log.info("Logging function reference for:", key)
  --         log.debug("Function reference:", value["after"]) -- Logs the reference
  --         log.info("Calling the function...")
  --         value["after"]()                                 -- Call the function
  --         log.info("Function executed successfully.")
  --       end
  --     end
  --   end,
  -- },
}
