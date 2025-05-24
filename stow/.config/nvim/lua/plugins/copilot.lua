return {
    "zbirenbaum/copilot.lua",
    commit = "0b435497295f01e253f3c1777e02f4553da7f59d",
    event = "LspAttach",
    dependencies = {
        { "giuxtaposition/blink-cmp-copilot", commit = "c5c5cbce5748d21073f1d5348a92ebe6ce63f387" },
    },
    cmd = "Copilot",
    opts = {
        copilot_model = "gpt-4o-copilot",
        panel = { enabled = false },
        suggestion = { enabled = false },
        filetypes = {
            tex = false,
        },
    },
}
