return {
    "stevearc/conform.nvim",
    version = "9.0.0",
    config = function()
        require("conform").setup({
            formatters = {
                ["latexindent"] = {
                    prepend_args = { "-y", "defaultIndent: '    '" },
                },
                ["prettier"] = {
                    prepend_args = {
                        "--tab-width",
                        "4",
                    },
                },
            },
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
                tex = { "latexindent" },
            },
        })
    end,
}
