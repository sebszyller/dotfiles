local function show_path_only(opts)
    ---@type string
    local header_or_block = ""
    if opts.anchor then
        header_or_block = opts.anchor.anchor
    elseif opts.block then
        header_or_block = string.format("#%s", opts.block.id)
    end
    return string.format("[[%s%s]]", opts.id, header_or_block)
end

return {
    "obsidian-nvim/obsidian.nvim",
    version = "3.14.6",
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
    },
    config = function()
        require("obsidian").setup({
            backlinks = { parse_headers = false },
            frontmatter = { enabled = false },
            footer = { enabled = false },
            log_level = vim.log.levels.WARN,
            parse_headers = false,
            status_line = { enabled = false },
            ui = {
                reference_text = {},
                external_link_icon = { char = "" },
            },
            wiki_link_func = show_path_only,
            workspaces = {
                { name = "knowledge-base", path = vim.fn.expand("~") .. "/obsidian" },
            },
        })
    end,
}
