return {
	"epwalsh/obsidian.nvim",
	tag = "v3.8.1",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
	},
	config = function()
		require("obsidian").setup({
			disable_frontmatter = true,
			log_level = vim.log.levels.WARN,
			workspaces = {
				{ name = "knowledge-base", path = vim.fn.expand("~") .. "/obsidian" },
			},
			ui = {
				reference_text = {},
				external_link_icon = { char = "" },
			},
			wiki_link_func = function(opts)
				---@type string
				local header_or_block = ""
				if opts.anchor then
					header_or_block = opts.anchor.anchor
				elseif opts.block then
					header_or_block = string.format("#%s", opts.block.id)
				end
				return string.format("[[%s%s]]", opts.id, header_or_block)
			end,
		})
		vim.api.nvim_set_hl(0, "ObsidianBullet", { fg = require("zenbones.palette").dark.blossom.hex })
		local opts = { noremap = false, silent = true }
        -- stylua: ignore start
		_map("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Backlinks", unpack(opts) })
		_map("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New note", unpack(opts) })
		-- stylua: ignore end
	end,
}
