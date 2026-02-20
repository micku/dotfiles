vim.g.java_ignore_markdown = true

local dap = require('dap')

dap.configurations.java = {
    {
        type = 'java',
        request = 'attach',
        name = 'Attach to remote',
        connect = function()
            local host = vim.fn.input('Host [127.0.0.1]: ')
            host = host ~= '' and host or '127.0.0.1'
            local port = tonumber(vim.fn.input('Port [5005]: ')) or 5005
            return { host = host, port = port }
        end,
    },
}
