return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			-- Main Pluggin
			"mfussenegger/nvim-dap",

			-- TODO: hacer algun comentario
			"nvim-telescope/telescope-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",

			-- Add your own debuggers here
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
		},
		opts = {
			controls = {
				element = "repl",
				enabled = false,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.50 },
						{ id = "stacks", size = 0.30 },
						{ id = "watches", size = 0.10 },
						{ id = "breakpoints", size = 0.10 },
					},
					size = 40,
					position = "left", -- Can be "left" or "right"
				},
				{
					elements = { "repl", "console" },
					size = 10,
					position = "bottom", -- Can be "bottom" or "top"
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		},
		config = function(_, opts)
			local dap = require("dap")
			require("dapui").setup(opts)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				-- Commented to prevent DAP UI from closing when unit tests finish
				-- require('dapui').close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				-- Commented to prevent DAP UI from closing when unit tests finish
				-- require('dapui').close()
			end

			local keymap = vim.keymap
			-- Basic debugging keymaps, feel free to change to your liking!
			keymap.set(
				"n",
				"<leader>bb",
				"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
				{ desc = "Debug: Toggle breakpoint" }
			)
			keymap.set(
				"n",
				"<leader>bc",
				"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				{ desc = "Debug: Set conditional breakpoint" }
			)
			keymap.set(
				"n",
				"<leader>bl",
				"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
				{ desc = "Debug: Set log point" }
			)
			keymap.set(
				"n",
				"<leader>br",
				"<cmd>lua require'dap'.clear_breakpoints()<cr>",
				{ desc = "Debug: Clear breakpoints" }
			)
			keymap.set(
				"n",
				"<leader>ba",
				"<cmd>Telescope dap list_breakpoints<cr>",
				{ desc = "Debug: Telescope breakpoints" }
			)
			keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Debug: Continue" })
			keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug: Step over" })
			keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Debug: Step into" })
			keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Debug: Step out" })
			keymap.set("n", "<leader>dd", function()
				require("dap").disconnect()
				require("dapui").close()
			end, { desc = "Debug: Disconnect" })
			keymap.set("n", "<leader>dt", function()
				require("dap").terminate()
				require("dapui").close()
			end, { desc = "Debug: Terminate" })
			keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Debug: Toggle REPL" })
			keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Debug: Run last" })
			keymap.set("n", "<leader>di", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Debug: Information" })
			keymap.set("n", "<leader>d?", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "Debug: Scopes" })
			keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Debug: Telescope frames" })
			keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Debug: Telescope commands" })
			keymap.set("n", "<leader>de", function()
				require("telescope.builtin").diagnostics({ default_text = ":E:" })
			end, { desc = "Debug: Telescope diagnostics" })

			-- -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			-- vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
			--
			-- dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			-- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			-- dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- Install golang specific config
			require("dap-go").setup()

			-- Install python specific config
			require("dap-python").setup("/opt/artlogic/bin/python")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		opts = {
			-- Display debug text as a comment
			commented = true,
			-- Customize virtual text
			display_callback = function(variable, buf, stackframe, node, options)
				if options.virt_text_pos == "inline" then
					return " = " .. variable.value
				else
					return variable.name .. " = " .. variable.value
				end
			end,
		},
	},
}
