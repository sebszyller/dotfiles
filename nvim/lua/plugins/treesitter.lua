return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
    local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
                "bash",
                "html", "css", "scss",
                "javascript", "typescript",
                "json", "yaml", "toml", "csv",
                "lua",
                "markdown", "markdown_inline",
                "python",
                "regex",
                "rust",
                "vim"
          },
          sync_install = false,
          auto_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}
