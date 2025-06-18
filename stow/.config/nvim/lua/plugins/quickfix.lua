return {
    {
        "stevearc/quicker.nvim",
        version = "1.4.0",
        event = "FileType qf",
        opts = {},
    },
    {
        "kevinhwang91/nvim-bqf",
        version = "1.1.1",
        event = "FileType qf",
        opts = {
            delay_syntax = 10,
            preview = {
                buf_label = false,
                show_scrollbar = false,
                winblend = 0,
            },
        },
    },
}
