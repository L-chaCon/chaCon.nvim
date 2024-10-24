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
			yaml = {
				"ansible_lint",
			},
		}
		-- correr al guardar
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("PythonLint", { clear = true }),
			pattern = { "*.py" },
			callback = function()
				require("lint").try_lint()
				-- require("lint").try_lint("pylint") -- NOTE: This is only for extreme verbose lint
			end,
		})
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("GoLint", { clear = true }),
			pattern = { "*.go" },
			callback = function()
				print("ACUERDATE DE CONFIGURRAR EL LINTER THE GO")
			end,
		})
		-- FIX: NEED TO MAKE THIS AUTOMATIC (OR ON OFF) FOR ANSIBLE
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("Ansible", { clear = true }),
			pattern = { "*.yml", "*.yaml" },
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
