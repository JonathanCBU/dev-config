return {
	"nvim-zh/colorful-winsep.nvim",
	event = { "WinNew" },
	dependencies = { "tiagovla/tokyodark.nvim" },
	config = function()
		require("colorful-winsep").setup({
			animate = { enabled = false },
		})
	end,
}
