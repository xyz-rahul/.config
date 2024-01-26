-- Enable line numbers
vim.opt.number = true
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Set the tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable smart indenting
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Disable swapfile creation
vim.opt.swapfile = false

-- Disable backup files
vim.opt.backup = false

-- Set the undo directory to ~/.vim/undodir
vim.opt.undodir = vim.fn.expand("$HOME") .. "/.vim/undodir"

-- Enable persistent undo by creating undo files
vim.opt.undofile = true

-- Disable highlighting of search results
vim.opt.hlsearch = false

-- Enable incremental search
vim.opt.incsearch = true

vim.opt.ignorecase = true
-- Enable true color support in the terminal
vim.opt.termguicolors = true

-- Set the minimum number of lines to keep above and below the cursor when scrolling
vim.opt.scrolloff = 16

-- Always show the sign column (used for signs like Git gutter indicators)
vim.opt.signcolumn = "yes"

-- Allow filenames to contain '@'
vim.opt.isfname:append("@-@")

-- Set the time in milliseconds for triggering CursorHold events (50ms)
vim.opt.updatetime = 50

vim.o.termguicolors = true

-- Highlight column 80 to help with code formatting
vim.opt.colorcolumn = "80"

vim.o.updatetime = 50

-- show error only in floating box
vim.diagnostic.config({
	virtual_text = false,
	float = {
		source = "always", -- Or "if_many"
	},
})
