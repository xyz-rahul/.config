return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({

            filters = {
                dotfiles = true,
                git_ignored = false,
            },
        })
    end,
}
