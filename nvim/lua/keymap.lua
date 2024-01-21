vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<Esc>", { desc = "Map jj to escape in insert mode" })

-- Map leader key followed by "pv" to execute the Ex command
vim.keymap.set("n", "<C-e>", vim.cmd.Ex, { desc = "open netrw vim default file explorer" })

-- Visual mode: Move the selected lines down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down in visual mode" })

-- Visual mode: Move the selected lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up in visual mode" })

-- Normal mode: Join the current line with the line below
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join current line with line below" })

-- Set up key mapping for scrolling down and centering the current line
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Set up key mapping for scrolling up and centering the current line
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Normal mode: Move to the next search result and center the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next search result and center the screen" })

-- Normal mode: Move to the previous search result and center the screen
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search result and center the screen" })

-- Visual mode: Cut and paste to the black hole register, effectively deleting without affecting the default register
vim.keymap.set("x", "<leader>p", [["_dP"]], { desc = "Cut and paste to black hole register in visual mode" })

-- Normal and visual mode: Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y"]], { desc = "Yank to system clipboard in normal and visual mode" })

-- Normal mode: Yank to the system clipboard from the current line to the end of the file
vim.keymap.set("n", "<leader>Y", [["+Y"]], { desc = "Yank to system clipboard from current line to end of file" })

-- Normal and visual mode: Delete to the black hole register, effectively deleting without affecting the default register
vim.keymap.set(
	{ "n", "v" },
	"<leader>d",
	[["_d"]],
	{ desc = "Delete to black hole register in normal and visual mode" }
)

-- Insert mode: Map Ctrl+C to escape, a commonly used key sequence for leaving insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Map Ctrl+C to escape in insert mode" })

-- Normal mode: Jump to the next location list item and center the screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Jump to next location list item and center the screen" })

-- Normal mode: Substitute the word under the cursor globally with confirmation
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Substitute word globally with confirmation" }
)

-- Normal mode: Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make the current file executable", silent = true })

-- Normal mode: Reload the current file
vim.keymap.set("n", "<leader>rl", function()
	vim.cmd("so")
end, { desc = "Reload the current file" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move current line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move current line up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move current line down in insert mode" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move current line up in insert mode" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move visually selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move visually selected lines up" })

-- Buffers
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Switch to the previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Switch to the next buffer" })

-- Clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

-- Window
vim.keymap.set("n", "<leader>q", ":bd <CR>", { desc = "Close buffer", remap = true })

-- -- Switch between windows in normal mode
-- vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Move to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Move to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Move to the window below" })
-- vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Move to the window above" })
