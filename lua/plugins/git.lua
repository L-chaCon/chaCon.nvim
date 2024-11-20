return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				numhl = true,
			})

			vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[G]it [P]review Changes" })
			vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "[G]it [B]lame" })
			vim.keymap.set(
				"n",
				"<leader>gB",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				{ desc = "Disabl  line [G]it [B]lame" }
			)
			vim.keymap.set(
				"n",
				"<leader>gl",
				"<cmd>Gitsigns toggle_linehl<cr>",
				{ desc = "[G]it toggle [L]ine highlight" }
			)
			vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "[G]it toggle [D]eleted" })
			vim.keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { desc = "[G]it next [H]unk" })
			vim.keymap.set("n", "<leader>gN", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[G]it previous [H]unk" })
		end,
	},
}
