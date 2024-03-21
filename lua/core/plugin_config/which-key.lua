vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup() 

require("which-key").register {
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
}
