local hl = vim.api.nvim_set_hl
local palette = require("zenbones.palette")
local green = palette.dark.leaf.hex
local blue = palette.dark.water.hex

-- LSP
hl(0, "LspInlayHint", { link = "Comment" })
hl(0, "Type", { fg = green })
hl(0, "Constant", { fg = blue, italic = true })

-- Markdown
hl(0, "@markup.link.label.markdown_inline", { fg = blue, underline = true })
hl(0, "@markup.raw.markdown_inline", { link = "Comment" })
for i = 1, 6 do
	hl(0, "@markup.heading." .. i .. ".markdown", { fg = green, bold = true })
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
