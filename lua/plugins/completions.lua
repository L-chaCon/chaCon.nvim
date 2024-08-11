return {
	-- {
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		vim.keymap.set("n", "<leader>gcd", ":Copilot disable<CR>", { desc = "[D]isable Copilot" })
	-- 		vim.keymap.set("n", "<leader>gce", ":Copilot enable<CR>", { desc = "[E]nable Copilot" })
	-- 		vim.keymap.set("n", "<leader>gcs", ":Copilot status<CR>", { desc = "[S]tatus Copilot" })
	-- 		vim.keymap.set("n", "<leader>gcu", ":Copilot setup<CR>", { desc = "Set [U]p Copilot" })
	-- 		vim.keymap.set("n", "<leader>gci", ":Copilot signin<CR>", { desc = "Sign [I]n Copilot", silent = true })
	-- 		vim.keymap.set("n", "<leader>gco", ":Copilot signout<CR>", { desc = "Sing [O]ut Copilot", silent = true })
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.api.nvim_set_keymap("i", "<c-y>", 'copilot#Accept("\\<CR>")', {
	-- 			expr = true,
	-- 			replace_keycodes = false,
	-- 			silent = true,
	-- 		})
	-- 	end,
	-- },
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
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			-- `/` cmdline setup.
			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- Setup for vim-dadbod
			cmp.setup.filetype({ "sql", "mysql", "mariadb" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(), -- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),
					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
}
