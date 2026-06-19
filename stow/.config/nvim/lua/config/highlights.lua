local hl = vim.api.nvim_set_hl

local palette = require("zenbones.palette").dark
local bg = palette.bg.hex
local blue = palette.water.hex
local green = palette.leaf.hex
local magenta = palette.blossom.hex
local yellow = "#d4a85c"

local selection = { fg = yellow, bg = bg }

-- LSP
hl(0, "LspInlayHint", { link = "Comment" })
hl(0, "Type", { fg = green })

hl(0, "@markup.link.label.markdown_inline", { fg = blue, underline = true })
hl(0, "@markup.raw.markdown_inline", { fg = magenta, italic = true })

hl(0, "typescriptTemplate", { link = "@string" })
hl(0, "typescriptString", { link = "@string" })
hl(0, "tsxString", { link = "@string" })

hl(0, "@module.latex", { fg = green, bold = true })
hl(0, "plaintexControlSequence", { fg = magenta })
hl(0, "@function.latex", { fg = magenta })
hl(0, "ObsidianBullet", { fg = green })
hl(0, "@string", { fg = blue })

-- UI
hl(0, "TelescopeSelection", selection)
hl(0, "TelescopeSelectionCaret", selection)
hl(0, "QuickFixLine", selection)

hl(0, "NormalFloat", { bg = "none" })
hl(0, "FloatBorder", { bg = "none" })
hl(0, "FloatTitle", { bg = "none" })
hl(0, "TelescopeBorder", { bg = "none" })

hl(0, "Pmenu", { bg = "none" })
hl(0, "PmenuSbar", { bg = "none" })
hl(0, "PmenuSel", selection)
hl(0, "PmenuThumb", { bg = "none" })

hl(0, "BlinkCmpLabel", { link = "Identifier" })
hl(0, "BlinkCmpLabelDetail", { link = "Comment" })
hl(0, "BlinkCmpLabelDescription", { link = "Comment" })

hl(0, "StatusLine", { reverse = false })
hl(0, "StatusLineNC", { reverse = false })
