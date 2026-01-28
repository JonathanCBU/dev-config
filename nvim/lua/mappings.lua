-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- File saving and quitting
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>z", "<cmd>wq<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Go back to file explorer
vim.keymap.set("n", "<leader>pve", vim.cmd.Ex, { desc = "Open file explorer" })

-- Yanking and pasting reconfig
vim.keymap.set("n", "Y", "yiw", { desc = "Yank word from inside" })
vim.keymap.set("n", "y", "Y", { desc = "Yank whole line on single `y`" })
vim.keymap.set("n", "<leader>p", '"_diw"0P', { desc = "Paste word underline without overwriting register" })
vim.keymap.set("n", "<leader>x", "*``cgn", { desc = 'Replace word with "." to replace next instances' })

-- Quick Movement
vim.keymap.set({ "n", "v" }, "<leader>j", "10j", { desc = "Move 10 lines down" })
vim.keymap.set({ "n", "v" }, "<leader>k", "10k", { desc = "Move 10 lines up" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Config Access
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>", { desc = "Edit vim config" })

-- Tree view
vim.keymap.set("n", "<leader>pv", ":Neotree toggle<CR>", { desc = "Toggle File [E]xplorer" })
vim.keymap.set("n", "<leader>pf", ":Neotree focus<CR>", { desc = "Toggle File [E]xplorer" })
vim.keymap.set("n", "<leader>pg", ":Neotree git_status toggle<CR>", { desc = "Toggle File [E]xplorer" })

-- Bulk edit macros
vim.keymap.set("n", "<leader>dd", [[:s/\s\+//g<CR>]], { desc = "Remove all whitespace from current line" })

-- Terminal
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal in current window" })
vim.keymap.set(
	"n",
	"<leader>ts",
	":belowright split | terminal<CR>",
	{ desc = "Open terminal in horizontal split below" }
)
vim.keymap.set(
	"n",
	"<leader>tv",
	":belowright vsplit | terminal<CR>",
	{ desc = "Open terminal in vertical split right" }
)

-- Terminal mode navigation - use Ctrl+hjkl to navigate between splits from terminal
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window from terminal" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to lower window from terminal" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to upper window from terminal" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window from terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit insert mode from terminal" })

-- Copy file name / paths to clipboard
vim.keymap.set("n", "<leader>cf", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
	print("Copied filename: " .. vim.fn.expand("%:t"))
end, { desc = "[C]opy [F]ilename" })

vim.keymap.set("n", "<leader>cr", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Copied relative path: " .. vim.fn.expand("%"))
end, { desc = "[C]opy [R]elative path" })

vim.keymap.set("n", "<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	print("Copied full path: " .. vim.fn.expand("%:p"))
end, { desc = "[C]opy full [P]ath" })

vim.keymap.set("n", "<leader>cd", function()
	vim.fn.setreg("+", vim.fn.expand("%:p:h"))
	print("Copied directory: " .. vim.fn.expand("%:p:h"))
end, { desc = "[C]opy [D]irectory" })
