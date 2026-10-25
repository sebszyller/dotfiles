return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    commit = "a2f694478be07f89c2d03cc17858a8745a400c4b",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        -- stylua: ignore start
        local parsers = {
            "bash", "fish",
            "regex",
            "diff",
            "git_config", "git_rebase",
            "c", "cpp", "cuda", "rust",
            "python",
            "javascript", "typescript", "html", "svelte", "css", "scss",
            "json", "yaml", "toml", "csv", "xml",
            "vim", "vimdoc",
            "lua",
            "markdown", "markdown_inline",
            "latex",
            "sql",
        }
        -- stylua: ignore start

        for _, parser in ipairs(parsers) do
            ts.install(parser)
        end

        -- Not every tree-sitter parser is the same as the file type detected
        -- So the patterns need to be registered more cleverly
        local patterns = {}
        for _, parser in ipairs(parsers) do
            local parser_patterns = vim.treesitter.language.get_filetypes(parser)
            for _, pp in pairs(parser_patterns) do
                table.insert(patterns, pp)
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
