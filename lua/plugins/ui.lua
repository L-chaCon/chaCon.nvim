return {
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "moonfly",
				},
				inactive_sections = {
					lualine_a = { "buffers" },
					lualine_b = { "filename" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "tabs" },
					lualine_z = {},
				},
			})
		end,
	},
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
	-- TODO: ESTA MIERDA NO ME FUNCIONA
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
