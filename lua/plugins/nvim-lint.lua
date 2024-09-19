return {
	"mfussenegger/nvim-lint",
	event = "BufWritePost",
	config = function()
		require("lint").linters_by_ft = {
			python = {
				"mypy",
			},
			go = {
				"golangcilint",
			},
		}
		-- correr al guardar
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = { "*.py", "*.go" },
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
