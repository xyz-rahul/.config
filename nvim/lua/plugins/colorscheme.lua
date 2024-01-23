return {
	{
		"rose-pine/neovim",
		as = "rose-pine",
		lazy = false,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				disable_background = true,
			})
			vim.cmd("colorscheme rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
