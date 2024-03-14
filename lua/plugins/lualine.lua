return {
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
}
