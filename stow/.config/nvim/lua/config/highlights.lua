local hl = vim.api.nvim_set_hl
local palette = require("zenbones.palette")
local bg = palette.dark.bg.hex
local blue = "#7788aa"
local green = "#789978"
local yellow = "#a1938c"

-- LSP
hl(0, "LspInlayHint", { link = "Comment" })
hl(0, "Type", { fg = green })
hl(0, "Constant", { italic = true })

hl(0, "@markup.link.label.markdown_inline", { fg = blue, underline = true })
hl(0, "@markup.raw.markdown_inline", { link = "Comment" })
for i = 1, 6 do
    hl(0, "@markup.heading." .. i .. ".markdown", { fg = green, bold = true })
end

hl(0, "@module.latex", { fg = green })
hl(0, "ObsidianBullet", { fg = green })
hl(0, "@string", { fg = blue, italic = true })

-- UI
hl(0, "TelescopeSelection", { fg = yellow, bg = bg })
hl(0, "TelescopeSelectionCaret", { fg = yellow })
hl(0, "QuickFixLine", { fg = yellow, bg = bg })

hl(0, "NormalFloat", { bg = "none" })
hl(0, "FloatBorder", { bg = "none" })
hl(0, "FloatTitle", { bg = "none" })
hl(0, "TelescopeBorder", { bg = "none" })

hl(0, "Pmenu", { bg = "none" })
hl(0, "PmenuSbar", { bg = "none" })
hl(0, "PmenuSel", { fg = yellow, bg = bg })

hl(0, "PmenuThumb", { bg = "none" })
hl(0, "BlinkCmpLabel", { link = "Identifier" })
hl(0, "BlinkCmpLabelDetail", { link = "Comment" })
hl(0, "BlinkCmpLabelDescription", { link = "Comment" })

hl(0, "StatusLine", { reverse = false })
hl(0, "StatusLineNC", { reverse = false })
