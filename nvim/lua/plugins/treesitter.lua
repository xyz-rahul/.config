return {
	{
		"nvim-treesitter/nvim-treesitter",
		--init = function()
		--end,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			local options = {
				ensure_installed = { "lua", "javascript", "javascriptreact" },

				highlight = {
					enable = true,
					use_languagetree = true,
				},

				indent = { enable = true },
			}

			return options
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
