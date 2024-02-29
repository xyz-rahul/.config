return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5", -- or , branch = '0.1.x',
		config = function()
			local builtin = require("telescope.builtin")
			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",

					layout_strategy = "horizontal", --horizontal = 2 vertical splits no idea why
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.90,
						height = 0.80,
						preview_cutoff = 120,
					},
					mappings = {},
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules" }, --ignore
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})

			require("telescope").load_extension("fzf")

			-- Set key mappings using vim.api.nvim_set_keymap
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gg",
				"<cmd>Telescope live_grep<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>fh",
				"<cmd>Telescope help_tags<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gf",
				"<cmd>Telescope git_files<cr>",
				{ noremap = true, silent = true }
			)
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
	},
}
