return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "[G]it [B]ranches" })
			vim.keymap.set("n", "<leader>g;", ":Telescope git_status<CR>", { desc = "Git Status in Telescope" })
			vim.keymap.set("n", "<leader>gsw", ":Telescope git_stash<CR>", { desc = "[G]it [S]tash [W]indow" })
			vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { desc = "[G]it [D]iff" })
			vim.keymap.set("n", "<leader>gss", ":Git stash<CR>", { desc = "[G]it [S]ta[S]h" })
			vim.keymap.set("n", "<leader>gsp", ":Git stash pop<CR>", { desc = "[G]it [S]tash [P]op" })
			vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>", { desc = "[G]it [A]dd [A]ll" })
			vim.keymap.set("n", "<leader>gaf", ":Git add %<CR>", { desc = "[G]it [A]dd [F]ile" })
			vim.keymap.set("n", "<leader>grr", ":Git reset .<CR>", { desc = "Git Rest All" })
			vim.keymap.set("n", "<leader>grf", ":Git reset %<CR>", { desc = "[G]it [R]est [F]ile" })
			vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "[G]it Pu[L]l" })
			vim.keymap.set("n", "<leader>gc", ":Git commit -m '", { desc = "[G]it [C]ommit" })
			vim.keymap.set("n", "<leader>gu", ":Git push<CR>", { desc = "[G]it P[U]sh" })
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
