return {
	"nvim-treesitter/nvim-treesitter",
	tag = "v0.9.2",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "fd41b7ccc5490a3a99c734d1ee418b68d06c48a9" },
	},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["if"] = "@function.inner",
						["af"] = "@function.outer",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ii"] = "@conditional.inner",
						["ai"] = "@conditional.outer",
					},
				},
			},
			ensure_installed = {
				"bash",
				"fish",
				"html",
				"css",
				"scss",
				"c",
				"cpp",
				"cuda",
				"javascript",
				"typescript",
				"json",
				"yaml",
				"toml",
				"csv",
				"lua",
				"latex",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"vim",
			},
			sync_install = false,
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
