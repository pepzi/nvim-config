require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer' }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename something' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'code action...' })

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'goto definition?...' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'goto implementation?...' })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'lsp references...' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'hover...' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}
require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
