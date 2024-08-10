return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				numhl = true,
			})

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "[G]it [P]review Changes" })
			vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "[G]it [B]lame" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Disable line [G]it [B]lame" }
			)
			vim.keymap.set(
				"n",
				"<leader>gtl",
				":Gitsigns toggle_linehl<CR>",
				{ desc = "[G]it [T]oggle [L]ine highlight" }
			)
			vim.keymap.set("n", "<leader>gtd", ":Gitsigns toggle_deleted<CR>", { desc = "[G]it [T]oggle [D]eleted" })
			vim.keymap.set("n", "<leader>gaf", ":Gitsigns stage_buffer<CR>", { desc = "[G]it [A]dd current [F]ile" })
			vim.keymap.set("n", "<leader>gah", ":Gitsigns stage_buffer<CR>", { desc = "[G]it [A]dd current [H]unk" })
			vim.keymap.set("n", "<leader>ghn", ":Gitsigns next_hunk<CR>", { desc = "[G]it next [H]unk" })
			vim.keymap.set("n", "<leader>ghN", ":Gitsigns prev_hunk<CR>", { desc = "[G]it previous [H]unk" })
		end,
	},
}
