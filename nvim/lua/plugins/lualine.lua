return {
	"nvim-lualine/lualine.nvim",
	commit = "2a5bae925481f999263d6f5ed8361baef8df4f83",
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

		require("lualine").setup({
			options = opts,
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", path = 1, color = muted_gray },
					{ "branch", icons_enabled = false, color = muted_gray },
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end -- not recording
							return "[recording @" .. reg .. "]"
						end,
						color = muted_gray,
					},
				},
				lualine_x = {
					{ "diagnostics", icons_enabled = false, color = muted_gray },
					{
						function()
							local clients = vim.lsp.buf_get_clients()
							if next(clients) == nil then
								return "no lsp"
							end

							local c = {}
							for _, client in pairs(clients) do
								table.insert(c, client.name)
							end
							return table.concat(c, "|")
						end,
						color = muted_gray,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
