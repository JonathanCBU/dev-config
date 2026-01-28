-- Tree navigator with icons
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "bottom",
				width = 40,
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			git_status = {
				symbols = {
					added = "+",
					modified = "m",
					deleted = "d",
					renamed = "r",
					untracked = "u",
					ignored = "i",
					unstaged = "!",
					staged = "s",
					conflict = "X",
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
						vim.cmd([[ setlocal relativenumber ]])
					end,
				},
			},
		})
	end,
}
