local set = vim.opt

set.formatoptions:remove "o"

vim.keymap.set({'n', 'v', 'i'}, "<F5>", "<cmd>!./build.sh<cr>")
