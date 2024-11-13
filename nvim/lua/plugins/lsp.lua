return {
	"neovim/nvim-lspconfig",
	version = "0.1.8",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local lspkind = require("lspkind")
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- stylua: ignore start
				-- "stylua", "lua-language-server",
				-- "clangd", "clang-format",
				-- "rust-analyzer",
				-- "basedpyright", "ruff",
				-- "svelte-language-server", "typescript-language-server", "prettier",
				-- "texlab",
				-- stylua: ignore end
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			experimental = {
				ghost_text = false,
			},
			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					menu = {
						buffer = "[BUF]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[API]",
						path = "[PATH]",
						luasnip = "[SNIP]",
					},
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 10, keyword_length = 2 },
				{ name = "nvim_lua", max_item_count = 5, keyword_length = 2 },
				{ name = "luasnip", max_item_count = 1, keyword_length = 2 },
			}, {
				{ name = "buffer", max_item_count = 2, keyword_length = 2 },
				{ name = "path", max_item_count = 2, keyword_length = 2 },
			}),
			window = {
				-- completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	end,
}
