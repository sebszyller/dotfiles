return {
    "nvim-lualine/lualine.nvim",
    commit = "482ae358c67aec2a4939d68a1a4fe4c8064ccd16",
    lazy = false,
    config = function()
        local muted_gray = "Identifier"

        local auto = require("lualine.themes.auto")
        local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
        for _, field in ipairs(lualine_modes) do
            if auto[field] and auto[field].c then
                auto[field].c.bg = "NONE"
            end
        end

        local opts = {}
        opts.theme = auto
        opts.component_separators = ""
        opts.ection_separators = ""

        local function show_macro()
            local reg = vim.fn.reg_recording()
            return "[recording @" .. reg .. "]"
        end

        local function show_search_count()
            local result = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

            if result.total == 0 then
                return ""
            end

            if result.incomplete == 1 then
                return string.format("matches [?/%d]", result.total)
            elseif result.incomplete == 2 then
                return "matches [>999]"
            else
                return string.format("matches [%d/%d]", result.current, result.total)
            end
        end

        local function show_lsp_info()
            local clients = vim.lsp.buf_get_clients()
            local c = {}
            for _, client in pairs(clients) do
                table.insert(c, client.name)
            end
            return table.concat(c, "|")
        end

        require("lualine").setup({
            options = opts,
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    { "filename", path = 1, color = muted_gray },
                    { "branch", icons_enabled = false, color = muted_gray },
                    -- stylua: ignore start
                    { show_macro,        cond = function() return vim.fn.reg_recording() ~= "" end, color = muted_gray },
                    { show_search_count, cond = function() return vim.v.hlsearch == 1 end,          color = muted_gray },
                    -- stylua: ignore end
                },
                lualine_x = {
                    { "diagnostics", icons_enabled = false, color = muted_gray },
                    -- stylua: ignore
                    { show_lsp_info, cond = function() return next(vim.lsp.buf_get_clients()) ~= nil end, color = muted_gray },
                },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
