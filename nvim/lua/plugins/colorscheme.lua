return {
	"rose-pine/neovim",
	version = "3.0.1",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		local palette = require("rose-pine.palette")
		require("rose-pine").setup({
			styles = {
				transparency = true,
			},
			highlight_groups = {
				["@text.quote.markdown"] = { fg = palette.subtle, italic = true },
				["@text.reference.markdown_inline"] = { fg = palette.foam, underline = true },
				["@text.literal.markdown_inline"] = { link = "Comment" },
				LspInlayHInt = { link = "Comment" },
				Visual = { bg = palette.highlight_high },
			},
		})
		vim.o.background = "dark"
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
