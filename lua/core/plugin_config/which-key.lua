vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup() 

require("which-key").register {
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>o'] = { name = '[O]bsidian', _ = 'which_key_ignore' },
  ['<leader>ol'] = { name = '[O]bsidian [L]inks', _ = 'which_key_ignore' },
}
