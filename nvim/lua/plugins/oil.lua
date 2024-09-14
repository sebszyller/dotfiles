return {
	"stevearc/oil.nvim",
	version = "2.12.2",
	lazy = false,
	opts = {},
	config = function()
		require("oil").setup({
			columns = { "icon" },
			default_file_explorer = false,
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-p>"] = {
					callback = function()
						local oil = require("oil")
						oil.open_preview({ vertical = true, split = "botright" })
					end,
				},
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			win_options = {
				signcolumn = "yes",
			},
		})
		local function toggle_netrw()
			if vim.bo.filetype == "netrw" then
				vim.cmd("Rex")
			else
				vim.cmd("Ex")
			end
		end

		local opts = { noremap = true, silent = true }
        -- stylua: ignore start
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil", unpack(opts) })
		vim.keymap.set("n", "_", function() toggle_netrw() end, { desc = "Netrw", unpack(opts) })
		-- stylua: ignore end
		vim.g.netrw_altv = 1
		vim.g.netrw_banner = 0
		vim.g.netrw_keepdir = 0
		vim.g.netrw_indent = 4
		vim.g.netrw_list_hide = ""
		vim.g.netrw_liststyle = 3
		vim.g.netrw_preview = 1
	end,
}
