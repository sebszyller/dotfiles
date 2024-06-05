local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local default_group = augroup("DefaultGroup", {})

local map = vim.keymap.set

autocmd({ "BufWritePre" }, {
	group = default_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = default_group,
	callback = function(e)
		local opts = {
			buffer = e.buf,
			noremap = true,
			silent = true,
		}
		local function toggle_inlay_hints()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end
        -- stylua: ignore start
		map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Definition", unpack(opts) })
		map("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover", unpack(opts) })
		map("n", "<leader>vf", function() vim.diagnostic.open_float() end, { desc = "Float", unpack(opts) })
		map("n", "<leader>va", function() vim.lsp.buf.code_action() end, { desc = "Code action", unpack(opts) })
		map("n", "<leader>vr", function() vim.lsp.buf.references() end, { desc = "References", unpack(opts) })
		map("n", "<leader>vr", function() vim.lsp.buf.rename() end, { desc = "Rename", unpack(opts) })
		map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Show signatures", unpack(opts) })
		map("n", "H", function() toggle_inlay_hints() end, { desc = "Toggle hints", unpack(opts) })
		-- stylua: ignore end
	end,
})

autocmd({ "TextYankPost" }, {
	group = default_group,
	pattern = "*",
	command = [[silent! lua vim.highlight.on_yank {higroup=(vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"), timeout=500}]],
})

autocmd({ "FileType" }, {
	group = default_group,
	pattern = "markdown",
	command = [[set conceallevel=2]],
})

autocmd({ "FileType" }, {
	group = default_group,
	pattern = "help",
	command = [[wincmd L]],
})
