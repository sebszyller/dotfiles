return {
    "zbirenbaum/copilot.lua",
    commit = "a064570939f23ef155698654c98c81e0fc2dc54a",
    event = "LspAttach",
    dependencies = {
        { "fang2hou/blink-copilot", commit = "7ad8209b2f880a2840c94cdcd80ab4dc511d4f39" },
        {
            "copilotlsp-nvim/copilot-lsp",
            commit = "1b6d8273594643f51bb4c0c1d819bdb21b42159d",
            init = function()
                vim.g.copilot_nes_debounce = 300
            end,
        },
    },
    cmd = "Copilot",
    config = function()
        local nes = require("copilot-lsp.nes")

        ---@param client vim.lsp.Client
        ---@param au integer
        function nes.lsp_on_init(client, au)
            local debounced_request = require("copilot-lsp.util").debounce(
                require("copilot-lsp.nes").request_nes,
                vim.g.copilot_nes_debounce or 500
            )

            vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
                callback = function()
                    debounced_request(client)
                end,
                group = au,
            })

            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                    local td_params = vim.lsp.util.make_text_document_params()
                    client:notify("textDocument/didFocus", {
                        textDocument = {
                            uri = td_params.uri,
                        },
                    })
                end,
                group = au,
            })
        end
        require("copilot").setup({
            copilot_model = "claude-sonnet-4-5",
            panel = { enabled = false },
            suggestion = { enabled = false },
            filetypes = {
                tex = false,
                plaintex = false,
            },
            nes = {
                enabled = true,
                keymap = {
                    accept_and_goto = "<C-i>",
                    accept = false,
                    dismiss = "<Esc>",
                },
            },
        })
    end,
}
