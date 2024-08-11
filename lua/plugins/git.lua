return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				numhl = true,
			})

			vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[G]it [P]review Changes" })
			vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "[G]it [B]lame" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				{ desc = "Disable line [G]it [B]lame" }
			)
			vim.keymap.set(
				"n",
				"<leader>gtl",
				"<cmd>Gitsigns toggle_linehl<cr>",
				{ desc = "[G]it [T]oggle [L]ine highlight" }
			)
			vim.keymap.set(
				"n",
				"<leader>gtd",
				"<cmd>Gitsigns toggle_deleted<cr>",
				{ desc = "[G]it [T]oggle [D]eleted" }
			)
			vim.keymap.set(
				"n",
				"<leader>gaf",
				"<cmd>Gitsigns stage_buffer<cr>",
				{ desc = "[G]it [A]dd current [F]ile" }
			)
			vim.keymap.set(
				"n",
				"<leader>gah",
				"<cmd>Gitsigns stage_buffer<cr>",
				{ desc = "[G]it [A]dd current [H]unk" }
			)
			vim.keymap.set("n", "<leader>ghn", "<cmd>Gitsigns next_hunk<cr>", { desc = "[G]it next [H]unk" })
			vim.keymap.set("n", "<leader>ghN", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[G]it previous [H]unk" })
		end,
	},
}
