return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "bash", "html", "javascript", "lua", "markdown", "python", "rust", "typescript" },
          sync_install = false,
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
          additional_vim_regex_highlighting = false,
        })
    end
 }
