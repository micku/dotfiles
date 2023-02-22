return {
    "mfussenegger/nvim-dap",
    dependencies = {"rcarriga/nvim-dap-ui"},
    config = function ()
        local dap, dapui = require("dap"), require("dapui")

	dapui.setup({})

	dap.adapters.node2 = {
          type = "executable",
          command = "node",
          args = {os.getenv("HOME") .. "/dev/personal/microsoft/vscode-node-debug2/out/src/nodeDebug.js"},
        }

        local typescript_config = {
          {
            name = "Launch",
            type = "node2",
            request = "launch",
            program = "${workspaceFolder}/dist/index.js",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
          },
          {
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = "Attach to process",
            type = "node2",
            request = "attach",
            processId = require"dap.utils".pick_process,
          },
	  {
	    name = "Integration tests",
	    type = "node2",
            request = "launch",
            console = "integratedTerminal",
	    program = "${workspaceFolder}/node_modules/.bin/jest",
	    skipFiles = {"*/<node_internals>/**/*.js", "node_modules/**/*.js"},
            cwd = "${workspaceFolder}",
            sourceMaps = true,
	    args = {"-i", "--config", "test/integration/jest/config.json", "--detectOpenHandles", "-i", "--forceExit", "${file}"},
          }
        }

	dap.configurations.javascript = typescript_config
	dap.configurations.typescript = typescript_config

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end

	vim.fn.sign_define("DapBreakpoint", {text="⬤", texthl="", linehl="", numhl=""})
    end
}
