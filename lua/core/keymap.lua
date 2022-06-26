-- Mapping helper
local keymap = require("core.utils").keymap
-- keymap("n", "<leader>ff", "<cmd> lua require('telescope.builtin').find_files()<CR>")
-- keymap("n", "<leader>fg", "<cmd> lua require('telescope.builtin').live_grep()<CR>")
-- keymap("n", "<leader>fb", "<cmd> lua require('telescope.builtin').buffers()<CR>")
-- keymap("n", "<leader>fh", "<cmd> lua require('telescope.builtin').help_tags()<CR>")
keymap("n", "<C-n>", ":NvimTreeToggle<CR>")
keymap("n", "<C-p>", ":Telescope projects<CR>")
keymap("n", "<leader>gb", ":BufferLinePick<CR>")
keymap("i", "jj", "<Esc>") -- map jj to esc
keymap("n", "<Leader>nn", ":set number!<CR>") -- toggle line numbers
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
keymap("n", "<Leader>sp", "a<C-X>s")


keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>")
keymap("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
keymap("v", "<leader>s", "<cmd>lua require('spectre').open_visual()<CR>")
keymap("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<CR>")

-- zen-mode
keymap("n", "<Leader>z", ":ZenMode<CR>")
