local home = os.getenv('HOME')
local jdtls = require('jdtls')

-- TODO: This path is useful in multiple context(ie. format.lua) and may be extracted
local mason_packages_path = vim.fn.stdpath "data" .. "/mason/packages/"
local jdtls_path = mason_packages_path .. "jdtls/"
local java_debug_path = mason_packages_path .. "java-debug-adapter/"
local java_test_path = mason_packages_path .. "java-test/"

local root_dir = vim.fn.getcwd()

-- Getting the last 2 folders to handle the master/main branch when organizing projects
--  in the <project>/<branch> format.
--  For example `~/projects/my_project/main` and `~/projects/my_2_project/main` would
--  have the same workspace folder `main` if we only get the last folder.
local _, _, project_folder = string.find(vim.fn.fnamemodify(root_dir, ":p:h"), "(/[^/]*/[^/]*)$")
local workspace_folder = home .. "/.local/share/eclipse/" .. project_folder

local bundles = {
    vim.fn.glob(java_debug_path .. "extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
};
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "extension/server/*.jar", 1), "\n"))

local config = {
    flags = {
        debounce_text_changes = 80,
    },
    -- cmd = {jdtls_path .. "bin/jdtls"},
    cmd = {
        "java",
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. jdtls_path .. 'lombok.jar',
        '-jar', vim.fn.glob(jdtls_path .. 'plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', jdtls_path .. 'config_linux',
        '-data', workspace_folder,
    },
    root_dir = root_dir,

    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
        },
    },

    -- TODO: These are debugging configurations, those should stay in debugger.lua
    init_options = {
        bundles = bundles,
    },
}
jdtls.start_or_attach(config)
