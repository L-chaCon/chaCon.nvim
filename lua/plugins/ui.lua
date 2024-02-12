return {
  -- DASHBOARD DE INICIO
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local startify = require("alpha.themes.startify")

      -- Set header
      startify.section.header.val = {
        [[       _..._                                _..._       .-'''-.                ]],
        [[    .-'_..._''.                          .-'_..._''.   '   _    \              ]],
        [[  .' .'      '.\  .                    .' .'      '.\/   /` '.   \    _..._    ]],
        [[ / .'           .'|                   / .'          .   |     \  '  .'     '.  ]],
        [[. '            <  |                  . '            |   '      |  '.   .-.   . ]],
        [[| |             | |             __   | |            \    \     / / |  '   '  | ]],
        [[| |             | | .'''-.   .:--.'. | |             `.   ` ..' /  |  |   |  | ]],
        [[. '             | |/.'''. \ / |   \ |. '                '-...-'`   |  |   |  | ]],
        [[ \ '.          .|  /    | | `" __ | | \ '.          .              |  |   |  | ]],
        [[  '. `._____.-'/| |     | |  .'.''| |  '. `._____.-'/              |  |   |  | ]],
        [[    `-.______ / | |     | | / /   | |_   `-.______ /               |  |   |  | ]],
        [[             `  | '.    | '.\ \._,\ '/            `                |  |   |  | ]],
        [[                '---'   '---'`--'  `"                              '--'   '--' ]],
      }
      alpha.setup(startify.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])
    end,
  },
  -- HELP PARA KEYMAPS
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.cmd(":TransparentEnable")
    end,
  },
}
