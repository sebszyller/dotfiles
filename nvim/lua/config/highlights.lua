local hl = vim.api.nvim_set_hl
local palette = require("zenbones.palette")
local blue = palette.dark.water.hex
local bg = palette.dark.bg.hex
local yellow = "#f6c177"

-- LSP
hl(0, "LspInlayHint", { link = "Comment" })
hl(0, "Type", { fg = blue })
hl(0, "Constant", { fg = yellow, italic = true })

-- Markdown
hl(0, "@markup.link.label.markdown_inline", { fg = blue, underline = true })
hl(0, "@markup.raw.markdown_inline", { link = "Comment" })
for i = 1, 6 do
	hl(0, "@markup.heading." .. i .. ".markdown", { fg = yellow, bold = true })
end

-- UI
hl(0, "TelescopeSelection", { fg = yellow, bg = bg })
hl(0, "QuickFixLine", { fg = yellow, bg = bg })

hl(0, "NormalFloat", { bg = "none" })
hl(0, "FloatBorder", { bg = "none" })
hl(0, "FloatTitle", { bg = "none" })
hl(0, "TelescopeBorder", { bg = "none" })

-- CMP
hl(0, "Pmenu", { bg = "none" })
hl(0, "PmenuSbar", { bg = "none" })
hl(0, "PmenuSel", { fg = yellow, bg = bg })

hl(0, "PmenuThumb", { bg = "none" })
hl(0, "BlinkCmpLabel", { link = "Identifier" })
hl(0, "BlinkCmpLabelDetail", { link = "Comment" })
hl(0, "BlinkCmpLabelDescription", { link = "Comment" })
