require("mason-tool-installer").setup({
	ensure_installed = {
		"eslint_d",
		"prettierd",
		"stylua",
	},
})

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		lua = { "stylua" },
		yaml = { "prettierd" },
	},
	format_on_save = { timeout_ms = 500 },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format" })

require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
}
