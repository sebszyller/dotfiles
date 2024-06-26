return {
	"epwalsh/obsidian.nvim",
	tag = "v3.8.1",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
	},
	config = function()
		local palette = require("rose-pine.palette")
		require("obsidian").setup({
			workspaces = {
				{ name = "knowledge-base", path = "~/obsidian" },
			},
			log_level = vim.log.levels.WARN,
			disable_frontmatter = true,
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
			-- hl_groups = {
			--     ObsidianBullet = { bold = true, fg = palette.faded_orange },
			-- }
		})
		-- need to highlgiht via API because hl_groups overriding is broken in obsidian.nvim right now
		vim.api.nvim_set_hl(0, "ObsidianBullet", { fg = palette.gold })

		local opts = { noremap = false, silent = true }
        -- stylua: ignore start
		vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", { desc = "Backlinks", unpack(opts) })
		vim.keymap.set("n", "<leader>ofl", ":ObsidianFollowLink<CR>", { desc = "Follow link", unpack(opts) })
		vim.keymap.set("n", "<leader>onn", ":ObsidianNew<CR>", { desc = "New note", unpack(opts) })
		-- stylua: ignore end
	end,
}
