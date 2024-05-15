return {
	"nvim-lualine/lualine.nvim",
	commit = "b5e8bb642138f787a2c1c5aedc2a78cb2cebbd67",
	lazy = false,
	config = function()
		local muted_gray = "Delimiter"
		require("lualine").setup({
			options = {
				theme = "rose-pine",
				component_separators = "",
				section_separators = "",
			},
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
					{ "encoding", icons_enabled = false, color = muted_gray },
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
