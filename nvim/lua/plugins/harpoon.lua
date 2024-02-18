return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>h0", function()
			harpoon:list():select(0)
		end)
		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader>h5", function()
			harpoon:list():select(5)
		end)

		vim.keymap.set("n", "<leader>h6", function()
			harpoon:list():select(6)
		end)
		vim.keymap.set("n", "<leader>h7", function()
			harpoon:list():select(7)
		end)
		vim.keymap.set("n", "<leader>h8", function()
			harpoon:list():select(8)
		end)
		vim.keymap.set("n", "<leader>h9", function()
			harpoon:list():select(9)
		end)
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end
	end,
}
