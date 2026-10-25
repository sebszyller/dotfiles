return {
    {
        "saghen/blink.cmp",
        version = "1.10.2",
        dependencies = { "fang2hou/blink-copilot" },
        opts = {
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
                        auto_show = function()
                            return not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
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
                    copilot = { name = "copilot", module = "blink-copilot", score_offset = 100, async = true },
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        version = "2.12.0",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            { "williamboman/mason.nvim", version = "2.3.1", opts = { ui = { border = "rounded" } } },
        },
        config = function()
            local blink = require("blink.cmp")

            vim.lsp.config("*", {
                capabilities = blink.get_lsp_capabilities({
                    textDocument = { completion = { completionItem = { snippetSupport = false } } },
                }),
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = { globals = { "vim", "it", "describe", "before_each", "after_each" } },
                    },
                },
            })

            vim.lsp.config("texlab", {
                capabilities = blink.get_lsp_capabilities(), -- snippets on; deep-merges over "*"
                settings = {
                    texlab = {
                        forwardSearch = {
                            executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                            args = { "-g", "%l", "%p", "%f" },
                        },
                    },
                },
            })

            -- "stylua", "lua-language-server",
            -- "clangd", "clang-format",
            -- "rust-analyzer",
            -- "basedpyright", "ruff",
            -- "svelte-language-server", "typescript-language-server", "prettier",
            -- "texlab", "latexindent",
            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "rust_analyzer",
                "basedpyright",
                "ruff",
                "svelte",
                "ts_ls",
                "texlab",
            })

            vim.diagnostic.config({
                virtual_text = true,
                float = { style = "minimal", border = "rounded", source = true, header = "", prefix = "" },
            })
        end,
    },
}
