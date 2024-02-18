return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		-- require("bufferline").setup({
		--
		-- 	options = {
		-- 		mode = "buffers", -- set to "tabs" to only show tabpages instead
		--
		-- 		indicator = {
		-- 			style = "underline",
		-- 		},
		-- 	},
		-- })
	end,
}
