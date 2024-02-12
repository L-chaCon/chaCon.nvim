return {
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
}
