-- Make line numbers default and relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Disable undofile for paths that would create filenames > 255 chars
vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function()
		local undodir = vim.fn.stdpath("state") .. "/undo/"
		local filepath = vim.fn.expand("%:p")
		local undofile = undodir .. filepath:gsub("/", "%%")

		-- macOS has a 255-byte filename limit
		if #undofile > 255 then
			vim.opt_local.undofile = false
		end
	end,
})

-- Clean up old/large undo files on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local undodir = vim.fn.stdpath("state") .. "/undo/"
		local max_age_days = 14 -- Remove undo files older than this
		local max_size_mb = 1 -- Remove undo files larger than this
		local now = os.time()

		vim.uv.fs_scandir(undodir, function(err, handle)
			if err or not handle then
				return
			end

			while true do
				local name, type = vim.uv.fs_scandir_next(handle)
				if not name then
					break
				end

				if type == "file" then
					local filepath = undodir .. name
					local stat = vim.uv.fs_stat(filepath)

					if stat then
						local age_days = (now - stat.mtime.sec) / 86400
						local size_mb = stat.size / 1048576

						-- Remove if too old or too large
						if age_days > max_age_days or size_mb > max_size_mb then
							vim.uv.fs_unlink(filepath)
						end
					end
				end
			end
		end)
	end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "·", nbsp = "␣", multispace = "·" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Line at 80 chars
vim.opt.colorcolumn = "79"
