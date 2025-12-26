local autocmd = vim.api.nvim_create_autocmd
local default_group = vim.api.nvim_create_augroup("DefaultGroup", { clear = true })
local copilot_group = vim.api.nvim_create_augroup("CopilotFocus", { clear = true })
local lsp_group = vim.api.nvim_create_augroup("LspGroup", { clear = true })
local obsidian_group = vim.api.nvim_create_augroup("ObsidianGroup", { clear = true })
local oil_group = vim.api.nvim_create_augroup("OilGroup", { clear = true })

autocmd("BufWritePre", {
    group = default_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("BufWritePre", {
    group = default_group,
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

autocmd("FocusLost", {
    group = copilot_group,
    callback = function()
        vim.cmd("silent! Copilot disable")
    end,
})

autocmd("FocusGained", {
    group = copilot_group,
    callback = function()
        vim.cmd("silent! Copilot enable")
    end,
})

autocmd("LspAttach", {
    group = lsp_group,
    callback = function(args)
        local opts = {
            buffer = args.buf,
            noremap = true,
            silent = true,
        }

        local function toggle_inlay_hints()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end

        local builtin = require("telescope.builtin")
        local lsp = vim.lsp.buf
        -- stylua: ignore start
        Globals.map("n", "gr",            builtin.lsp_references,                            Globals.extend(opts, { desc = "Find references" }))
        Globals.map("n", "gD", function() builtin.lsp_definitions({jump_type="vsplit"}) end, Globals.extend(opts, { desc = "Goto definition (split)" }))
        Globals.map("n", "gd",            lsp.definition,                                    Globals.extend(opts, { desc = "Goto definition" }))
        Globals.map("n", "gF",            vim.diagnostic.open_float,                         Globals.extend(opts, { desc = "Float" }))
        Globals.map("n", "ga",            lsp.code_action,                                   Globals.extend(opts, { desc = "Code action" }))
        Globals.map("n", "gR",            lsp.rename,                                        Globals.extend(opts, { desc = "Rename" }))
        Globals.map("n", "H",             toggle_inlay_hints,                                Globals.extend(opts, { desc = "Toggle hints" }))
        Globals.map("n", "K",  function() lsp.hover({border = "rounded"}) end,               Globals.extend(opts, { desc = "Hover" }))
        -- stylua: ignore end
    end,
})

autocmd("FileType", {
    group = lsp_group,
    pattern = { "tex", "latex" },
    callback = function(args)
        local opts = {
            buffer = args.buf,
            noremap = true,
            silent = true,
        }

        -- stylua: ignore
        Globals.map("n", "<leader>lf", ":TexlabForward<CR>", Globals.extend(opts, {  desc = "Forward search" }))
    end,
})

autocmd("TextYankPost", {
    group = default_group,
    pattern = "*",
    command = [[silent! lua vim.highlight.on_yank {higroup=(vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"), timeout=500}]],
})

local function get_cwd()
    local path = require("oil").get_current_dir()
    if path == "/" then
        return path
    else
        local result = {}
        for part in string.gmatch(path, "[^/]+") do
            table.insert(result, part)
        end
        return result[#result]
    end
end

autocmd("User", {
    group = oil_group,
    pattern = { "OilEnter", "OilMutationComplete" },
    callback = function()
        local ns_id = vim.api.nvim_create_namespace("cwd")

        local opts = {
            id = 1,
            virt_text = { { get_cwd(), "Comment" } },
            virt_text_pos = "eol",
        }

        vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
        vim.api.nvim_buf_set_extmark(0, ns_id, 0, 0, opts)
    end,
})

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

autocmd("User", {
    group = obsidian_group,
    pattern = { "ObsidianNoteEnter", "ObsidianNoteWritePost" },
    callback = function(args)
        local bufnr = args.buf
        local note = require("obsidian.note").from_buffer(bufnr)
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
    end,
})

autocmd("User", {
    group = obsidian_group,
    pattern = "ObsidianNoteEnter",
    callback = function(args)
        local opts = { buffer = args.bufnr, noremap = false, silent = true }
        -- stylua: ignore start
        Globals.map("n", "gd",         ":Obsidian follow_link<CR>",        Globals.extend(opts, { desc = "Follow link" }))
        Globals.map("n", "gD",         ":Obsidian follow_link vsplit<CR>", Globals.extend(opts, { desc = "Follow link (split)" }))
        Globals.map("n", "<leader>ob", ":Obsidian backlinks<CR>",          Globals.extend(opts, { desc = "Backlinks" }))
        Globals.map("n", "<leader>on", ":Obsidian new<CR>",                Globals.extend(opts, { desc = "New note" }))
        -- stylua: ignore end
    end,
})

autocmd("VimLeavePre", {
    group = default_group,
    pattern = "*",
    callback = function()
        require("sesh").save_sesh(vim.fn.getcwd())
    end,
})
