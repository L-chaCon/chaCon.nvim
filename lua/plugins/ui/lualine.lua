return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local spelling_component = function()
				---@diagnostic disable-next-line: undefined-field
				return "✎ -> " .. (vim.opt.spell:get() and "On" or "Off")
			end
			require("lualine").setup({
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics", "venv-selector" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress", spelling_component },
					lualine_z = { "location" },
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
}
