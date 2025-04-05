return {
    "zbirenbaum/copilot.lua",
    commit = "228cd7456fd923b8da3eb6497bb345de58b93637",
    event = "LspAttach",
    dependencies = {
        { "giuxtaposition/blink-cmp-copilot", commit = "c5c5cbce5748d21073f1d5348a92ebe6ce63f387" },
    },
    cmd = "Copilot",
    opts = {
        panel = { enabled = false },
        suggestion = { enabled = false },
        filetypes = {
            tex = false,
        },
    },
}
