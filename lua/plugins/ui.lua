return {
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	-- NOICE #TODO: Agregar a la configuracion de noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp (I have it in completions.lua)
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
				},
			})
			-- Telescope noice
			require("telescope").load_extension("noice")
			-- Keymaps
			vim.keymap.set("n", "<leader>nd", function()
				require("noice").cmd("dismiss")
			end, { desc = "[N]oice [D]ismiss Messages" })
			vim.keymap.set(
				"n",
				"<leader>nt",
				":NoiceTelescope<CR>",
				{ desc = "Show all [N]oice Messages in [T]elescope" }
			)
			vim.keymap.set("n", "<leader>nl", function()
				require("noice").cmd("last")
			end, { desc = "Show [N]oice [L]ast Message" })
			vim.keymap.set("n", "<leader>nh", function()
				require("noice").cmd("history")
			end, { desc = "Show [N]oice [H]istory" })
			vim.keymap.set("n", "<leader>ni", function()
				require("noice").cmd("disable")
			end, { desc = "[N]oice D[i]sable" })
			vim.keymap.set("n", "<leader>nn", function()
				require("noice").cmd("enable")
			end, { desc = "[N]oice E[n]able" })
			vim.keymap.set("n", "<leader>ne", function()
				require("noice").cmd("error")
			end, { desc = "[N]oice [E]rror" })
			vim.keymap.set("n", "<leader>ns", function()
				require("noice").cmd("stats")
			end, { desc = "[N]oice [S]tats" })
		end,
	},
	-- HELP PARA keymap
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()
			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>b"] = { name = "[B]reakepoint", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ebuggin", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>ga"] = { name = "[G]it [A]dd", _ = "which_key_ignore" },
				["<leader>gr"] = { name = "[G]it [R]est", _ = "which_key_ignore" },
				["<leader>gs"] = { name = "[G]it [S]tash", _ = "which_key_ignore" },
				["<leader>gc"] = { name = "[G]it [C]opilot", _ = "which_key_ignore" },
				["<leader>n"] = { name = "[N]oise", _ = "which_key_ignore" },
				["<leader>x"] = { name = "Trouble", _ = "which_key_ignore" },
			})
		end,
	},
	-- TODO COMMENTS
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- Dashboard de Inicio
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local startify = require("alpha.themes.startify")
			startify.section.header.val = {
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢲⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⠷⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⠁⢀⣴⣶⣶⡀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⡀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⣾⡿⠓⠶⣤⡀⠀⠀]],
				[[⠈⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠄⠀⣴⣶⣶⣶⣤⣤⣼⣿⣿⣿⣿⣿⡌⠻⣦⢻⡀⠀]],
				[[⠀⠸⣿⣿⣿⣿⣶⣦⠀⠀⠀⠀⢤⣴⣾⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣄]],
				[[⠀⠀⢻⣿⣿⣿⣿⣿⠀⠀⠰⣄⠀⠀⠉⠛⠛⠿⠧⠀⠘⠛⠛⠋⠉⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿]],
				[[⠀⠀⠈⢿⣿⣿⡿⠏⠀⠀⠀⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀]],
				[[⠀⠀⠀⠀⠉⠉⠀⠀⠀⢀⣼⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠲⢶⣶⣿⣿⣿⣿⣿⣿⣧⣴⣶⣶⣦⣤⣄⣀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⠋⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠙⣿⠇⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠃⣼⡇⣸⠏⠀⠀⢻⣿⣿⣿⣿⡏⣸⡆⡟⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⠀⢋⠔⠁⠀⠀⠀⢸⣿⣿⡿⣿⡇⠛⢠⠁⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⠏⢰⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⡇⢸⣿⣶⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⣼⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣷⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣧⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⠛⢿⣿⣧⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢹⣿⣿⣄⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀]],
			}
			startify.section.header.opts.position = "center"
			alpha.setup(startify.opts)
		end,
	},
	-- COLORSCHEME
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("moonfly")
			vim.g.moonflyTransparent = true
		end,
	},
	-- TODO: ESta Mierda no me funciona
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		local transparent = require("transparent")
	-- 		transparent.setup({
	-- 			exclude_groups = {
	-- 				"NeoTreeNormal",
	-- 				"NoicePopup",
	-- 				"NoicePopupBorder",
	-- 				"TelescopeNormal",
	-- 			},
	-- 		})
	-- 		vim.api.nvim_set_hl(0, "NotifyBackground", vim.api.nvim_get_hl_by_name("Normal", true))
	-- 	end,
	-- },
	-- NEOTREE #TODO: ARREGARL EL PRBLEMA QUE EL BUFER NO CARGA
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
			require("neo-tree").setup({
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
				popup_border_style = "rounded",
				window = {
					width = 30,
				},
				filesystem = {
					filtered_items = {
						visible = true, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false, -- only works on Windows for hidden files/directories
					},
				},
				event_handlers = {
					{
						event = "file_opened",
						handler = function()
							require("neo-tree.command").execute({ action = "close" })
						end,
					},
				},
			})

			vim.keymap.set(
				"n",
				"<C-n>",
				":Neotree filesystem reveal left<CR>",
				{ desc = "Open Neo-Tree [File] explorer" }
			)
			vim.keymap.set("n", "<C-b>", ":Neotree buffers right<CR>", { desc = "Open Neo-Tree [Buffer] explorer" })
			vim.keymap.set(
				"n",
				"<leader>pa",
				":Neotree toggle current reveal_force_cwd<cr>",
				{ desc = "Ir a explorador de Archivos" }
			)
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
