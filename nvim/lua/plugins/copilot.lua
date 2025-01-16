return {
	"zbirenbaum/copilot.lua",
	commit = "886ee73b6d464b2b3e3e6a7ff55ce87feac423a9",
	event = "LspAttach",
	dependencies = {
		{ "giuxtaposition/blink-cmp-copilot", commit = "c5c5cbce5748d21073f1d5348a92ebe6ce63f387" },
	},
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = { enabled = false },
		})
	end,
}
