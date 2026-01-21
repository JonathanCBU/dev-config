-- Autoformat
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			return false
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			cs = { "csharpier" },

			markdown = { "prettierd", "prettier" },

			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },

			sh = { "shfmt" },
			zsh = { "shfmt" },
			bash = { "shfmt" },

			sql = { "sqlfluff", "sqlfmt" },
		},
	},
}
