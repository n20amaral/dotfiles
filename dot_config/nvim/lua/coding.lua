require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	highlight = {
		enable = true,
	},
})

require("nvim-treesitter").install({
	"lua",
	"bash",
	"python",
	"c_sharp",
	"javascript",
	"html",
	"css",
	"markdown",
	"yaml",
	"toml",
})

-- highlighting
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- indentation
-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "bashls", "pyright", "omnisharp", "ts_ls" },
})

local diag = vim.diagnostic
local map = vim.keymap.set

map("n", "<leader>cd", diag.open_float)
map("n", "<leader>dn", function()
	diag.jump({ count = 1 })
end, { desc = "Next diagnostic" })
map("n", "<leader>dp", function()
	diag.jump({ count = -1 })
end, { desc = "Prev diagnostic" })
map("n", "<leader>dq", function()
	diag.setqflist()
end, { desc = "Quickfix diagnostics" })
map("n", "<leader>dl", function()
	diag.setloclist()
end, { desc = "Location list" })
map("n", "<leader>dD", function()
	diag.enable(false)
end, { desc = "Disable diagnostics" })
map("n", "<leader>dE", function()
	diag.enable(true)
end, { desc = "Location list" })
map("n", "<leader>cq", ":cclose<cr>", { desc = "Close quickfix" })
map("n", "<leader>cl", ":lclose<cr>", { desc = "Close location list" })

require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		accept = { auto_brackets = { enabled = false } },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
})
