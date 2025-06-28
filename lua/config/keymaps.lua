-- Telescope
vim.keymap.set("n", "m", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "n", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "b", ":Telescope git_status<CR>", { noremap = true, silent = true })
