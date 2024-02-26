return {
	"jiaoshijie/undotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("undotree").setup()
		-- Save undo history
		vim.o.undofile = true
		vim.o.undodir = os.getenv("HOME") .. "/.local/.undotree_files"

		vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true, desc = 'Mostrar [U]ndo-tree'})
	end,
}
