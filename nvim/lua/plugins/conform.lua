return {
	"stevearc/conform.nvim",
	version = "5.7.0",
	config = function()
		local conform = require("conform")
		conform.formatters.prettier = {
			prepend_args = {
				"--tab-width",
				"4",
			},
		}
		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				cuda = { "clang-format" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format" },
				rust = { "rustfmt" },
				javascript = { { "prettier" } },
				typescript = { { "prettier" } },
				svelte = { { "prettier" } },
				html = { { "prettier" } },
				zig = { "zig fmt" },
			},
		})
	end,
}
