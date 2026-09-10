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
		format_on_save = function()
			return false
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },

			markdown = { "prettierd", "prettier", stop_after_first = true },

			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },

			sh = { "shfmt" },
			zsh = { "shfmt" },
			bash = { "shfmt" },

			sql = { "sqlfluff", "sqlfmt", stop_after_first = true },

			-- ruff_format formats, ruff_fix applies lint autofixes -- complementary,
			-- so both run in sequence (no stop_after_first here).
			python = { "ruff_format", "ruff_fix" },

			toml = { "taplo" },
		},
	},
}
