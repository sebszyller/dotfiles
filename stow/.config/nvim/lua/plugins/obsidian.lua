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

---@param note obsidian.Note
---@return string[]
local function unique_backlinks(note)
    local Note = require("obsidian.note")
    local backlinks = note:backlinks()
    local titles = {}
    local seen = {}

    for _, file_table in ipairs(backlinks) do
        local t = Note.from_file(file_table.path.filename).title
        if not seen[t] then
            titles[#titles + 1] = t
            seen[t] = true
        end
    end

    return titles
end

---@param note obsidian.Note
---@return nil
local function show_virtual_backlinks(note)
    local bufnr = vim.api.nvim_get_current_buf()
    local hl = "Comment"
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    local ns_id = vim.api.nvim_create_namespace("ObsidianVirtualBacklinks")

    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    local virt_lines = {}
    local backlinks = unique_backlinks(note)
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
    version = "3.14.6",
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
    },
    config = function()
        require("obsidian").setup({
            backlinks = { parse_headers = false },
            callbacks = {
                enter_note = function(note)
                    local opts = { buffer = note.bufnr, noremap = false, silent = true }
                    -- stylua: ignore start
                    Globals.map("n", "gd", ":Obsidian follow_link<CR>", Globals.extend(opts, { desc = "Follow link" }))
                    Globals.map("n", "gD", ":Obsidian follow_link vsplit<CR>", Globals.extend(opts, { desc = "Follow link (split)" }))
                    Globals.map("n", "<leader>ob", ":Obsidian backlinks<CR>", Globals.extend(opts, { desc = "Backlinks" }))
                    Globals.map("n", "<leader>on", ":Obsidian new<CR>",       Globals.extend(opts, { desc = "New note" }))
                    -- stylua: ignore end
                    show_virtual_backlinks(note)
                end,
            },
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
