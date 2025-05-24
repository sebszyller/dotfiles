return {
    "nvim-treesitter/nvim-treesitter",
    commit = "20a7e40203dab3454686e057adecd805f3d6d334",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", commit = "ad8f0a472148c3e0ae9851e26a722ee4e29b1595" },
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
