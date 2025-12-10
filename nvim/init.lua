-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("settings")

require("mappings")

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--    :Lazy

-- NOTE: To add a new plugin, create a new file in lua/custom/plugins/ that returns a plugin spec
require("lazy").setup({
	-- Import all plugin configurations from lua/custom/plugins/
	{ import = "custom.plugins" },
})

-- terminal customization
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal relativenumber number",
})
