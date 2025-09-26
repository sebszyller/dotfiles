return {
    "neovim/nvim-lspconfig",
    version = "1.7.0",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "saghen/blink.cmp", version = "1.3.1" },
        { "williamboman/mason.nvim", version = "1.11.0" },
        { "williamboman/mason-lspconfig.nvim", version = "1.32.0" },
    },
    config = function()
        local blink_cmp = require("blink.cmp")
        local lspconfig = require("lspconfig")

        blink_cmp.setup({
            keymap = {
                preset = "super-tab",
                ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
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
            signature = {
                enabled = true,
                trigger = {
                    enabled = true,
                    show_on_trigger_character = false,
                    show_on_insert_on_trigger_character = false,
                },
                window = { border = "rounded" },
            },
            sources = {
                default = { "lsp", "path", "copilot", "snippets", "buffer" },
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
                -- "texlab", "latexindent",
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
            virtual_text = true,
            float = {
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
