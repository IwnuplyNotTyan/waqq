(local keymap vim.keymap.set)

(keymap "n" "m" ":Telescope buffers<CR>" {:noremap true :silent true})
(keymap "n" "n" ":Telescope find_files<CR>" {:noremap true :silent true})
(keymap "n" "b" ":Telescope git_status<CR>" {:noremap true :silent true})
