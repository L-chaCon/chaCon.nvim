return {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true,
			keywords = { chaCon = { icon = "䷁", color = "chaCon" } },
			colors = { chaCon = { "#25BE6A" } },
		},
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
			{ "<leader>xt", "<cmd>Trouble todo<cr>", desc = "Trouble todo" },
		},
	},
}
