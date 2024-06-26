vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted lines" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted lines" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.keymap.set('i', '<C-Space>', "<Esc><Esc><Space>", {remap = true})

vim.keymap.set("n", "<space>g", ":Neogit<CR>", { desc = "Git" })

-- vim.keymap.set("n", "<space>oc", ":ObsidianCheck<CR>", { desc = "Check" })
-- vim.keymap.set("n", "<space>od", ":ObsidianDailies<CR>", { desc = "Dailies" })
-- vim.keymap.set("n", "<space>og", ":ObsidianTags<CR>", { desc = "Ta[g]s" })
-- vim.keymap.set("n", "<space>olb", ":ObsidianBacklinks<CR>", { desc = "Backlinks" })
-- vim.keymap.set("n", "<space>olf", ":ObsidianFollowLink<CR>", { desc = "Follow Link" })
-- vim.keymap.set("n", "<space>om", ":ObsidianTomorrow<CR>", { desc = "To[m]orrow" })
-- vim.keymap.set("n", "<space>on", ":ObsidianNew<CR>", { desc = "New" })
-- vim.keymap.set("n", "<space>o<space>", ":ObsidianQuickSwitch<CR>", { desc = "QuickSwitch" })
-- vim.keymap.set("n", "<space>op", ":ObsidianPasteImg<CR>", { desc = "Paste Image" })
-- vim.keymap.set("n", "<space>or", ":ObsidianRename<CR>", { desc = "Rename" })
-- vim.keymap.set("n", "<space>os", ":ObsidianSearch<CR>", { desc = "Search" })
-- vim.keymap.set("n", "<space>ot", ":ObsidianToday<CR>", { desc = "Today" })
-- vim.keymap.set("n", "<space>ow", ":ObsidianWorkspace<CR>", { desc = "Workspace" })
-- vim.keymap.set("n", "<space>oy", ":ObsidianYesterday<CR>", { desc = "Yesterday" })
-- vim.keymap.set("n", "<space>oll", ":ObsidianLinks<CR>", { desc = "[L]inks" })
-- vim.keymap.set("n", "<space>ou", ":ObsidianDebug<CR>", { desc = "Deb[U]g" })
-- vim.keymap.set("n", "<space>oe", ":ObsidianExtract<CR>", { desc = "[E]xtract Note" })
-- vim.keymap.set("n", "<space>oll", ":Obsidian<CR>", { desc = "[L]ink" })
-- vim.keymap.set("n", "<space>oln", ":Obsidian<CR>", { desc = "[N]ew Link" })
-- vim.keymap.set("n", "<space>oo", ":Obsidian<CR>", { desc = "[O]pen" })
-- vim.keymap.set("n", "<space>oa", ":ObsidianTemplate<CR>", { desc = "Templ[A]te" })

local wk = require("which-key")
wk.register({
	l = {
		name = "Lspsaga",
		c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		o = { "<cmd>Lspsaga outline<cr>", "Outline" },
		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
		f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
		p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
		s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
		w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
	},
}, { prefix = "<leader>" })
