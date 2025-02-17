return {
	"lewis6991/gitsigns.nvim",
	version = "0.7",
	event = "BufReadPre",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "-" },
			topdelete = { text = "-" },
			changedelete = { text = "~" },
			untracked = { text = "" },
		},
	},
}
