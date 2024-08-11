return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.keymap.set("n", "<leader>S", ":DBUI<CR>", { desc = "SQL", silent = true })

		vim.g.db_ui_table_helpers = {
			mariadb = {
				List = "SELECT * from {optional_schema}`{table}` LIMIT 200",
				Columns = "DESCRIBE {optional_schema}`{table}`",
				Indexes = "SHOW INDEXES FROM {optional_schema}`{table}`",
				ForeignKeys = "SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = '{dbname}' AND TABLE_NAME = '{table}' AND CONSTRAINT_TYPE = 'FOREIGN KEY'",
				PrimaryKeys = "SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = '{dbname}' AND TABLE_NAME = '{table}' AND CONSTRAINT_TYPE = 'PRIMARY KEY'",
				Unique = "SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = '{dbname}' AND TABLE_NAME = '{table}' AND CONSTRAINT_TYPE = 'UNIQUE'",
			},
		}
		vim.g.dbs = require("chaCon.sql")
	end,
}
