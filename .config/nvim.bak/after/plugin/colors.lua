function ColorMyPencils(color)
	color = color or "catppuccin-frappe"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()

vim.keymap.set('n', '<leader>tl', ':TransparentDisable<cr>:colorscheme catppuccin-latte<cr>')
vim.keymap.set('n', '<leader>td', ':TransparentEnable<cr>:colorscheme catppuccin-frappe<cr>')

