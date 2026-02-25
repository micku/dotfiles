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
    dependencies = {"nvim-neotest/nvim-nio"},
    config = function()
      local dapui = require("dapui")

      dapui.setup({})
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {"javadbg", "javatest"}
      })
    end
  },
}
