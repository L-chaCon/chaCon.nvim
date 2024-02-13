return {
	"nvimtools/none-ls.nvim",
	config = function()
		-- APLICAR FORMATTERS
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- PYTHON
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
        -- GO
        null_ls.builtins.formatting.goimports,
				-- MARKDOWN
				null_ls.builtins.formatting.mdformat,
			},
		})

		vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "Formatear el Documento" })
	end,
}
