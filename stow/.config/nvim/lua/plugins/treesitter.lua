return {
    "nvim-treesitter/nvim-treesitter",
    commit = "20a7e40203dab3454686e057adecd805f3d6d334",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-s>",
                    node_incremental = "<C-s>",
                    node_decremental = "<BS>",
                },
            },
            -- stylua: ignore start
			ensure_installed = {
				"bash", "fish", "regex",
				"diff", "git_config", "git_rebase",
				"c", "cpp", "cuda", "rust",
                "python",
				"javascript", "typescript", "html", "svelte", "css", "scss",
				"json", "yaml", "toml", "csv", "xml",
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
