return {
    "zbirenbaum/copilot.lua",
    commit = "a064570939f23ef155698654c98c81e0fc2dc54a",
    event = "LspAttach",
    dependencies = {
        { "fang2hou/blink-copilot", commit = "7ad8209b2f880a2840c94cdcd80ab4dc511d4f39" },
    },
    cmd = "Copilot",
    config = function()
        require("copilot").setup({
            copilot_model = "claude-sonnet-4-5",
            panel = { enabled = false },
            suggestion = { enabled = false },
            filetypes = {
                tex = false,
                latex = false,
                plaintex = false,
            },
        })
    end,
}
