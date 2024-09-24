return {
	"nvimdev/dashboard-nvim",
	commit = "e86e73afdd8d01e964e5c4028a1f243afd64b77b",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			shortcut_type = "letter",
			theme = "hyper",
			disable_move = true,
			config = {
				week_header = {
					enable = true,
				},
				footer = {},
				packages = { enable = false },
				shortcut = {
					{
						desc = "Files",
						group = "DiagnosticError",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = "Browser",
						group = "DiagnosticOk",
						action = "Ex",
						key = "b",
					},
					{
						desc = "Session",
						group = "DiagnosticInfo",
						action = "source .session.vim",
						key = "s",
					},
					{
						desc = "Lazy",
						group = "DiagnosticHint",
						action = "Lazy",
						key = "l",
					},
				},
				mru = { limit = 5, label = "Recent Files" },
			},
		})
	end,
}
