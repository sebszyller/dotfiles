return {
	"christoomey/vim-tmux-navigator",
	commit = "d847ea942a5bb4d4fab6efebc9f30d787fd96e65",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
