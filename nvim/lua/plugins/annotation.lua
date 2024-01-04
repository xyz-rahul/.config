return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("neogen").setup({
			enabled = true, --if you want to disable Neogen
			input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
			-- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
			languages = {
				javascript = {
					template = {
						annotation_convention = "jsdoc",
					},
				},
				lua = {
					template = {
						annotation_convention = "emmylua", -- for a full list of annotation_conventions, see doc,
					},
				},
				--to quickly add support for new filetypes based around existing ones
				["cpp.doxygen"] = require("neogen.configurations.cpp"),
			},
		})
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<Leader>cc", ":lua require('neogen').generate()<CR>", opts)
	end,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
