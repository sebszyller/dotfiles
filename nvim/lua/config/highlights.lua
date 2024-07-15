local hl = vim.api.nvim_set_hl
local palette = require("zenbones.palette")
local green = palette.dark.leaf.hex
local blue = palette.dark.water.hex

-- LSP
hl(0, "LspInlayHint", { link = "Comment" })
hl(0, "Type", { fg = green })
hl(0, "Constant", { fg = blue, italic = true })

-- Markdown
hl(0, "@text.quote.markdown", { link = "Comment" })
hl(0, "@text.reference.markdown_inline", { fg = blue, underline = true })
hl(0, "@text.emphasis.markdown_inline", { italic = true })
hl(0, "@text.strong.markdown_inline", { bold = true })
hl(0, "@text.literal.markdown_inline", { link = "Comment" })
for i = 1, 6 do
	hl(0, "@text.title." .. i .. ".markdown", { fg = green })
	hl(0, "@text.title." .. i .. ".marker.markdown", { fg = green })
end

-- UI
hl(0, "TelescopeSelection", { link = "Visual" })

hl(0, "NormalFloat", { bg = "none" })
hl(0, "FloatBorder", { bg = "none" })
hl(0, "FloatTitle", { bg = "none" })
hl(0, "TelescopeBorder", { bg = "none" })

hl(0, "Pmenu", { bg = "none" })
hl(0, "PmenuSbar", { bg = "none" })
hl(0, "PmenuThumb", { bg = "none" })
