return {
	"neovim/nvim-lspconfig",
	version = "1.3.0",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "saghen/blink.cmp", version = "0.9.2" },
		{ "saghen/blink.compat", version = "2.2.0" },
		{ "williamboman/mason.nvim", version = "1.10.0" },
		{ "williamboman/mason-lspconfig.nvim", version = "1.31.0" },
	},
	config = function()
		require("blink.compat").setup()
		local blink_cmp = require("blink.cmp")
		local lspconfig = require("lspconfig")

		local default_sources = { "lsp", "path", "snippets", "buffer" }
		blink_cmp.setup({
			completion = {
				list = { selection = "manual" },
				menu = {
					draw = { columns = { { "kind_icon", "label", "label_description", gap = 1 } } },
					auto_show = function(ctx)
						-- NOTE: don't show in cmd or search
						return not (ctx.mode == "cmdline" or vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()))
					end,
				},
			},
			keymap = {
				preset = "super-tab",
				cmdline = { preset = "super-tab" },
			},
			sources = {
				default = { "obsidian", unpack(default_sources) },
				providers = {
					obsidian = { name = "obsidian", module = "blink.compat.source" },
				},
			},
		})

		local capabilities = blink_cmp.get_lsp_capabilities({
			textDocument = { completion = { completionItem = { snippetSupport = false } } },
		})
		local capabilities_with_snippets = blink_cmp.get_lsp_capabilities()

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
				function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = { globals = { "vim", "it", "describe", "before_each", "after_each" } },
							},
						},
					})
				end,
				["texlab"] = function()
					lspconfig.texlab.setup({ capabilities = capabilities_with_snippets })
				end,
			},
		})

		vim.diagnostic.config({
			float = {
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
