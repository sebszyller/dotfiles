local autocmd = vim.api.nvim_create_autocmd
local default_group = vim.api.nvim_create_augroup("DefaultGroup", { clear = true })
local copilot_group = vim.api.nvim_create_augroup("CopilotFocus", { clear = true })
local lsp_group = vim.api.nvim_create_augroup("LspGroup", { clear = true })
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
        Globals.map("n", "gr",                    builtin.lsp_references,                            Globals.extend(opts, { desc = "Find references" }))
        Globals.map("n", "gD",         function() builtin.lsp_definitions({jump_type="vsplit"}) end, Globals.extend(opts, { desc = "Goto definition (split)" }))
        Globals.map("n", "gd",         function() lsp.definition() end,                              Globals.extend(opts, { desc = "Goto definition" }))
        Globals.map("n", "gF",         function() vim.diagnostic.open_float() end,                   Globals.extend(opts, { desc = "Float" }))
        Globals.map("n", "ga",         function() lsp.code_action() end,                             Globals.extend(opts, { desc = "Code action" }))
        Globals.map("n", "gR",         function() lsp.rename() end,                                  Globals.extend(opts, { desc = "Rename" }))
        Globals.map("n", "H",          function() toggle_inlay_hints() end,                          Globals.extend(opts, { desc = "Toggle hints" }))
        Globals.map("n", "K",          function() lsp.hover({border = "rounded"}) end,               Globals.extend(opts, { desc = "Hover" }))
        -- stylua: ignore end
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

autocmd("VimLeavePre", {
    group = default_group,
    pattern = "*",
    callback = function()
        require("sesh").save_sesh(vim.fn.getcwd())
    end,
})
