require('catppuccin').setup({ flavour = 'macchiato'})

vim.api.nvim_create_user_command('TokyoNight', 'colorscheme tokyonight', {})
vim.api.nvim_create_user_command('Catppuccin', 'colorscheme catppuccin', {})

vim.cmd.colorscheme('catppuccin')
