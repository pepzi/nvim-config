vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window'  })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', '<C-Space>', "<Esc><Esc><Space>", {remap = true})

vim.keymap.set("n", "<space>oo", ":ObsidianQuickSwitch<CR>", { desc = "QuickSwitch" })
vim.keymap.set("n", "<space>ot", ":ObsidianToday<CR>", { desc = "Today" })
vim.keymap.set("n", "<space>olf", ":ObsidianFollowLink<CR>", { desc = "Follow Link" })
vim.keymap.set("n", "<space>olb", ":ObsidianBacklinks<CR>", { desc = "Backlinks" })
vim.keymap.set("n", "<space>oc", ":ObsidianCheck<CR>", { desc = "Check" })
vim.keymap.set("n", "<space>os", ":ObsidianSearch<CR>", { desc = "Search" })
vim.keymap.set("n", "<space>or", ":ObsidianRename<CR>", { desc = "Rename" })
vim.keymap.set("n", "<space>oy", ":ObsidianYesterday<CR>", { desc = "Yesterday" })
vim.keymap.set("n", "<space>op", ":ObsidianPasteImg<CR>", { desc = "Paste Image" })
vim.keymap.set("n", "<space>od", ":ObsidianDailies<CR>", { desc = "Dailies" })
vim.keymap.set("n", "<space>og", ":ObsidianTags<CR>", { desc = "Ta[g]s" })
vim.keymap.set("n", "<space>om", ":ObsidianTomorrow<CR>", { desc = "To[m]orrow" })
vim.keymap.set("n", "<space>ow", ":ObsidianWorkspace<CR>", { desc = "Workspace" })
vim.keymap.set("n", "<space>on", ":ObsidianNew<CR>", { desc = "New" })
-- vim.keymap.set("n", "<space>o", ":Obsidian<CR>", { desc = "" })
-- ObsidianDebug
-- ObsidianExtractNote
-- ObsidianLink
-- ObsidianLinkNew
-- ObsidianLinks
-- ObsidianNew
-- ObsidianOpen
-- ObsidianTemplate
