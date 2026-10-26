return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				prettier = {
					prepend_args = { "--prose-wrap", "always" },
				},
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters = {
				["markdownlint-cli2"] = {
					prepend_args = {
						"--config",
						vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml",
						"--",
					},
				},
			},
		},
	},
}
