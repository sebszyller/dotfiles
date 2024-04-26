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

---@param client obsidian.Client
---@param note obsidian.Note
---@return string[]
local function unique_backlinks(client, note)
    local backlinks = client:find_backlinks(note)
    local titles = {}
    local seen = {}

    for _, file_table in ipairs(backlinks) do
        local t = file_table.note.title
        if not seen[t] then
            titles[#titles + 1] = t
            seen[t] = true
        end
    end

    return titles
end

---@param client obsidian.Client
---@param note obsidian.Note
---@return nil
local function show_virtual_backlinks(client, note)
    local bufnr = vim.api.nvim_get_current_buf()
    local hl = "Comment"
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    local ns_id = vim.api.nvim_create_namespace("ObsidianVirtualBacklinks")

    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    local virt_lines = {}
    local backlinks = unique_backlinks(client, note)
    if next(backlinks) == nil then
        table.insert(virt_lines, { { "[No backlinks]", hl } })
    else
        table.insert(virt_lines, { { "[Backlinks]", hl } })
        table.sort(backlinks)
        for _, title in ipairs(backlinks) do
            table.insert(virt_lines, { { title, hl } })
        end
    end

    vim.api.nvim_buf_set_extmark(bufnr, ns_id, line_count - 1, 0, {
        virt_lines = virt_lines,
        virt_lines_above = false,
    })
end

return {
    "obsidian-nvim/obsidian.nvim",
    commit = "a35108c1397b6fa90b6b9600d62897bc30f17ed9",
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
    },
    config = function()
        require("obsidian").setup({
            backlinks = { parse_headers = false },
            callbacks = { enter_note = show_virtual_backlinks },
            completion = { nvim_cmp = false, blink = true },
            disable_frontmatter = true,
            log_level = vim.log.levels.WARN,
            mappings = {
                ["gd"] = {
                    -- stylua: ignore
                    action = function() return "<cmd>ObsidianFollowLink<CR>" end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                ["gD"] = {
                    -- stylua: ignore
                    action = function() return "<cmd>ObsidianFollowLink vsplit<CR>" end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
            },
            parse_headers = false,
            ui = {
                reference_text = {},
                external_link_icon = { char = "" },
            },
            wiki_link_func = show_path_only,
            workspaces = {
                { name = "knowledge-base", path = vim.fn.expand("~") .. "/obsidian" },
            },
        })

        local opts = { noremap = false, silent = true }
        -- stylua: ignore start
		_map("n", "<leader>ob", ":Obsidian backlinks<CR>", { desc = "Backlinks", unpack(opts) })
		_map("n", "<leader>on", ":Obsidian new<CR>", { desc = "New note", unpack(opts) })
        -- stylua: ignore end
    end,
}
