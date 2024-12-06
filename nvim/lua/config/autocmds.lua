local autocmd = vim.api.nvim_create_autocmd
local default_group = vim.api.nvim_create_augroup("DefaultGroup", {})

local map = vim.keymap.set

autocmd({ "BufWritePre" }, {
	group = default_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
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

		local builtin = require("telescope.builtin")
        -- stylua: ignore start
		map("n", "<leader>fr",            builtin.lsp_references,                            { desc = "Find references", unpack(opts) })
        map("n", "gD",         function() builtin.lsp_definitions({jump_type="vsplit"}) end, { desc = "Goto definition (split)", unpack(opts) })
		map("n", "gd",         function() vim.lsp.buf.definition() end,                      { desc = "Goto definition", unpack(opts) })
		map("n", "gF",         function() vim.diagnostic.open_float() end,                   { desc = "Float", unpack(opts) })
		map("n", "ga",         function() vim.lsp.buf.code_action() end,                     { desc = "Code action", unpack(opts) })
		map("n", "gr",         function() vim.lsp.buf.rename() end,                          { desc = "Rename", unpack(opts) })
        map("n", "H",          function() toggle_inlay_hints() end,                          { desc = "Toggle hints", unpack(opts) })
        map("n", "K",          function() vim.lsp.buf.hover() end,                           { desc = "Hover", unpack(opts) })
		map("i", "<C-h>",      function() vim.lsp.buf.signature_help() end,                  { desc = "Show signatures", unpack(opts) })
		-- stylua: ignore end
	end,
})

autocmd({ "TextYankPost" }, {
	group = default_group,
	pattern = "*",
	command = [[silent! lua vim.highlight.on_yank {higroup=(vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"), timeout=500}]],
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

autocmd({ "VimLeavePre" }, {
	group = default_group,
	pattern = "*",
	callback = function()
		require("sesh").save_sesh(vim.fn.getcwd())
	end,
})
