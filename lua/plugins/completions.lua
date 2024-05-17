return {
	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set("n", "<leader>gcd", ":Copilot disable<CR>", { desc = "[D]isable Copilot" })
			vim.keymap.set("n", "<leader>gce", ":Copilot enable<CR>", { desc = "[E]nable Copilot" })
			vim.keymap.set("n", "<leader>gcs", ":Copilot status<CR>", { desc = "[S]tatus Copilot" })
			vim.keymap.set("n", "<leader>gcu", ":Copilot setup<CR>", { desc = "Set [U]p Copilot" })
			vim.keymap.set("n", "<leader>gci", ":Copilot signin<CR>", { desc = "Sign [I]n Copilot", silent = true })
			vim.keymap.set("n", "<leader>gco", ":Copilot signout<CR>", { desc = "Sing [O]ut Copilot", silent = true })
			-- vim.g.copilot_no_tab_map = true
			vim.cmd(":Copilot disable")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets
					-- This step is not supported in many windows environments
					-- Remove the below condition to re-enable on windows
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
		},
		config = function()
			-- See `:help cmp`
			vim.opt.completeopt = { "menu", "menuone", "noselect" }
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-y>"] = cmp.mapping(cmp.mapping.confirm({
						cmp.SelectBehavior.Insert,
						select = true,
					}, { "i", "c" })),
				},
				-- Enable LuaSnip
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "text_symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
					}),
				},
			})
			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "man", "!" },
						},
					},
				}),
			})
			-- Setup for vim-dadbod
			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})
			-- LUASNIP CONFIG
			local ls = require("luasnip")
			ls.config.set_config({
				history = false,
				updateevents = "TextChanged, TextChangedI",
			})
			for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/chaCon/snippets/*.lua", true)) do
				loadfile(ft_path)()
			end

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })
		end,
	},
}
