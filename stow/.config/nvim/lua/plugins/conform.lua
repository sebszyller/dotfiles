return {
    "stevearc/conform.nvim",
    version = "9.0.0",
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
                python = { "ruff_fix", "ruff_format", stop_after_first = false },
                rust = { "rustfmt" },
                json = { "prettier" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                svelte = { "prettier" },
                html = { "prettier" },
            },
        })
    end,
}
