vim.keymap.set("n", "s", vim.cmd.HopChar2)
vim.keymap.set("n", "gw", vim.cmd.HopWord)
vim.keymap.set("n", "gl", vim.cmd.HopLine)

vim.cmd[[hi HopNextKey guifg=#f78f38]]
vim.cmd[[hi HopNextKey1 guifg=#f78f38]]
vim.cmd[[hi HopNextKey2 guifg=#e645ff]]
