local autocmd = vim.api.nvim_create_autocmd
local default_group = vim.api.nvim_create_augroup("DefaultGroup", {})

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
		map("n", "gF", function() vim.diagnostic.open_float() end, { desc = "Float", unpack(opts) })
		map("n", "ga", function() vim.lsp.buf.code_action() end, { desc = "Code action", unpack(opts) })
		map("n", "gr", function() vim.lsp.buf.references() end, { desc = "References", unpack(opts) })
		map("n", "gR", function() vim.lsp.buf.rename() end, { desc = "Rename", unpack(opts) })
		map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Show signatures", unpack(opts) })
		map("n", "H", function() toggle_inlay_hints() end, { desc = "Toggle hints", unpack(opts) })
		-- stylua: ignore end
	end,
})

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

local function get_cwd()
	local path = require("oil").get_current_dir()
	if path == "/" then
		return path
	else
		local result = {}
		for part in string.gmatch(path, "[^/]+") do
			table.insert(result, part)
		end
		return result[#result]
	end
end

autocmd({ "User" }, {
	pattern = { "OilEnter" },
	callback = function()
		local ns_id = vim.api.nvim_create_namespace("cwd")

		local opts = {
			id = 1,
			virt_text = { { get_cwd(), "Directory" } },
			virt_text_pos = "overlay", -- eol has a space after ../
		}

		vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
		vim.api.nvim_buf_set_extmark(0, ns_id, 0, 13, opts) -- magic number 13 (first empty column after ../)
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

autocmd({ "VimLeavePre" }, {
	group = default_group,
	pattern = "*",
	command = [[mksession! .session.vim]],
})
