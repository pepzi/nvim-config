vim.g.codeium_enabled = false

vim.keymap.set('n', '<leader>ie', vim.cmd.CodeiumEnable, { desc = '[E]nable Codeium' })
vim.keymap.set('n', '<leader>id', vim.cmd.CodeiumDisable, { desc = '[D]isable Codeium' })
vim.keymap.set('n', '<leader>ii', vim.cmd.CodeiumToggle, { desc = '[I] Toggle Codeium' })
vim.keymap.set('n', '<leader>ia', vim.cmd.CodeiumAuto, { desc = 'Codeium [A]uto' })
vim.keymap.set('n', '<leader>im', vim.cmd.CodeiumManual, { desc = 'Codeium [M]anual' })

vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<M-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<M-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
