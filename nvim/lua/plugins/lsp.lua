return {
    "neovim/nvim-lspconfig",
    version = "1.7.0",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "saghen/blink.cmp", version = "1.3.0" },
        { "williamboman/mason.nvim", version = "1.11.0" },
        { "williamboman/mason-lspconfig.nvim", version = "1.32.0" },
    },
    config = function()
        local blink_cmp = require("blink.cmp")
        local lspconfig = require("lspconfig")

        local default_sources = { "lsp", "path", "snippets", "buffer" }
        blink_cmp.setup({
            keymap = {
                preset = "super-tab",
            },
            completion = {
                list = { selection = { auto_insert = false } },
                menu = { draw = { columns = { { "kind_icon", "label", "source_name", gap = 1 } } } },
            },
            cmdline = {
                keymap = { preset = "inherit" },
                completion = {
                    list = { selection = { auto_insert = false } },
                    menu = {
                        auto_show = function(ctx)
                            return not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()) -- NOTE: don't show in search
                        end,
                    },
                },
            },
            fuzzy = { sorts = { "exact", "score", "sort_text" } },
            sources = {
                default = { "copilot", unpack(default_sources) },
                min_keyword_length = 3,
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        })

        local capabilities = blink_cmp.get_lsp_capabilities({
            textDocument = { completion = { completionItem = { snippetSupport = false } } },
        })
        local capabilities_with_snippets = blink_cmp.get_lsp_capabilities()

        require("mason").setup({ ui = { border = "rounded" } })
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- stylua: ignore start
                -- "stylua", "lua-language-server",
                -- "clangd", "clang-format",
                -- "rust-analyzer",
                -- "basedpyright", "ruff",
                -- "svelte-language-server", "typescript-language-server", "prettier",
                -- "texlab",
                -- stylua: ignore end
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({ capabilities = capabilities })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = { globals = { "vim", "it", "describe", "before_each", "after_each" } },
                            },
                        },
                    })
                end,
                ["texlab"] = function()
                    lspconfig.texlab.setup({ capabilities = capabilities_with_snippets })
                end,
            },
        })

        vim.diagnostic.config({
            float = {
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end,
}
