return {
	"nvim-treesitter/nvim-treesitter",
	commit = "2d5133f67429f82547ea5fad33a0b1e7d4f78a1c",
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
            -- stylua: ignore start
			ensure_installed = {
				"bash", "fish", "regex",
				"diff", "git_config", "git_rebase",
				"c", "cpp", "cuda", "rust",
                "swift",
                "python",
				"javascript", "typescript", "html", "svelte", "css", "scss",
				"json", "yaml", "toml", "csv",
                "vim", "vimdoc", "lua",
                "markdown", "markdown_inline", "latex",
                "sql",
			},
			-- stylua: ignore end
			sync_install = false,
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
