return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {"rcarriga/nvim-dap-ui"},
    keys = {
      {"<F4>", "<cmd>DapTerminate<cr>", desc = "Debug terminate"},
      {"<F5>", "<cmd>DapContinue<cr>", desc = "Debug continue"},
      {"<F9>", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint"},
      {"<F10>", "<cmd>DapStepOver<cr>", desc = "Debug step over"},
      {"<F11>", "<cmd>DapStepInto<cr>", desc = "Debug step into"},
      {"<F12>", "<cmd>DapStepOut<cr>", desc = "Debug step out"},
    },
    config = function ()
      local dap = require("dap")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end

      vim.fn.sign_define("DapBreakpoint", {text="⬤", texthl="", linehl="", numhl=""})
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dapui = require("dapui")

      dapui.setup({})
    end
  },
}
