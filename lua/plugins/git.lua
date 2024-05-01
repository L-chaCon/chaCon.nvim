return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({})
			vim.keymap.set("n", "<leader>gaa", ":!git add .<CR>", { desc = "[G]it [A]dd [A]ll" })
			vim.keymap.set("n", "<leader>gaf", ":!git add %<CR>", { desc = "[G]it [A]dd [F]ile" })
			vim.keymap.set("n", "<leader>grr", ":!git reset .<CR>", { desc = "Git Rest All" })
			vim.keymap.set("n", "<leader>grf", ":!git reset %<CR>", { desc = "[G]it [R]est [F]ile" })
			vim.keymap.set("n", "<leader>gl", ":!git pull<CR>", { silent = true, desc = "[G]it Pu[L]l" })
			vim.keymap.set("n", "<leader>gu", ":!git push<CR>", { silent = true, desc = "[G]it P[U]sh" })
			vim.keymap.set("n", "<leader>g;", ":Neogit<CR>", { desc = "Neo-Git" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "[G]it [P]review Changes" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Display line [G]it [B]lame" }
			)
		end,
	},
}
