require("telescope").setup({})
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
	telescope.live_grep({ hidden = true })
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", telescope.resume, { desc = "Resume" })

require("oil").setup({})
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "<leader>e", ":Oil .<cr>", { desc = "Explorer current dir" })

require("mini.pairs").setup()

require("mini.surround").setup({
	mappings = {
		add = "sa", -- sa" wrap selection in ""
		delete = "sd", -- sd" delete surrounding ""
		find = "sf", -- sf" find surrounding ""
		find_left = "sF",
		highlight = "sh",
		replace = "sr", -- sr" replace surrounding ""
		around = "ar", -- sa] wrap in []
		new = "sn",
	},
})

require("mini.comment").setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = "<leader>/",

		-- Toggle comment on current line
		comment_line = "<leader>/l",

		-- Toggle comment on visual selection
		comment_visual = "<leader>/",

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		-- Works also in Visual mode if mapping differs from `comment_visual`
		textobject = "<leader>/",
	},
})

require("which-key").setup({})
