return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>m", group = "[M]arkdown" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>ga", group = "[G]it [A]dd" },
			{ "<leader>gh", group = "[G]it [H]unk" },
			{ "<leader>gt", group = "[G]it [T]oggle" },
			{ "<leader>l", group = "[L]sp" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>s", group = "Telescope" },
		},
	},
}
