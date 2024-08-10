return {
	{
		"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	},
	-- PARA COMMENTAR CODIGO
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	-- MARKDOWN
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- BAD HABITS
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("hardtime").setup({
				disable_mouse = false,
			})
			vim.o.cmdheight = 2
			vim.o.showmode = false
		end,
	},
}
