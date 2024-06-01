vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

wk.setup()

wk.register({
	["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	["<leader>d"] = { name = "[D]ap", _ = "which_key_ignore" },
	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
	["<leader>i"] = { name = "Code[I]um", _ = "which_key_ignore" },
	["<leader>l"] = { name = "[L]spsaga", _ = "which_key_ignore" },
	["<leader>p"] = { name = "[P]roject", _ = "which_key_ignore" },
	["<leader>n"] = { name = "[N]oice", _ = "which_key_ignore" },
	-- ["<leader>o"] = { name = "[O]bsidian", _ = "which_key_ignore" },
	-- ['<leader>ol'] = { name = '[O]bsidian [L]inks', _ = 'which_key_ignore' },
})
