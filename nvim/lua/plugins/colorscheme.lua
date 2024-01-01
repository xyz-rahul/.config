return {
    {
        "rose-pine/neovim",
        as = "rose-pine",
        lazy = false,
        config = function()
            require("rose-pine").setup({
                variant = "main",
            })
            vim.cmd("colorscheme rose-pine")
        end,
    },
}
