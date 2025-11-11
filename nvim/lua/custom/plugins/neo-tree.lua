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
				position = "right",
				width = 30,
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
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
		})
	end,
}
