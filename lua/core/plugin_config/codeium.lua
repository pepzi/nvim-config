-- local cd = require("codeium")
-- cd.setup({
--   enable_chat = true,
-- })

--vim.cmd('Codeium Enable')

vim.keymap.set('n', '<leader>ie', vim.cmd.CodeiumEnable, { desc = '[E]nable Codeium' })
vim.keymap.set('n', '<leader>id', vim.cmd.CodeiumDisable, { desc = '[D]isable Codeium' })
vim.keymap.set('n', '<leader>it', vim.cmd.CodeiumToggle, { desc = '[T]oggle Codeium' })
vim.keymap.set('n', '<leader>ia', vim.cmd.CodeiumAuto, { desc = 'Codeium [A]uto' })
vim.keymap.set('n', '<leader>im', vim.cmd.CodeiumManual, { desc = 'Codeium [M]anual' })

