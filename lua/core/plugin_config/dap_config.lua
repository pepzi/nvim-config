require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
if elixir_ls_debugger ~= "" then
  dap.adapters.mix_task = {
    type = "executable",
    command = elixir_ls_debugger,
  }

  dap.configurations.elixir = {
    {
      type = "mix_task",
      name = "phoenix server",
      task = "phx.server",
      request = "launch",
      projectDir = "${workspaceFolder}",
      exitAfterTaskReturns = false,
      debugAutoInterpretAllModules = false,
    }
  }
end

vim.keymap.set("n", "<space>d?", function ()
  require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<Leader>dc", dap.run_to_cursor, { desc = "Run to [c]ursor"})
vim.keymap.set("n", "<Leader>db", ':DapToggleBreakpoint<CR>', { desc = "[T]oggle Breakpoint"})
vim.keymap.set("n", "<Leader>dx", 'DapTerminate<CR>', { desc = "Terminate"})
vim.keymap.set("n", "<Leader>do", 'DapStepOver<CR>', {desc = "Step [O]ver"})
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F6>", dap.step_back)
vim.keymap.set("n", "<F7>", dap.restart)

