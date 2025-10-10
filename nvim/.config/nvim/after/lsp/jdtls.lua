local function get_mason_bundles()
    local function jars(path, pattern)
        return vim.split(vim.fn.glob(vim.fn.expand(path) .. '/' .. pattern), '\n')
    end

    local bundles = {}
    vim.list_extend(bundles, jars('$MASON/share/java-test', '*.jar'))
    vim.list_extend(bundles, jars('$MASON/share/java-debug-adapter', 'com.microsoft.java.debug.plugin-*.jar'))
    -- vim.list_extend(bundles, jars('$MASON/share/vscode-spring-boot-tools', 'jdtls/*.jar'))

    local excluded = {
        -- java-test
        'com.microsoft.java.test.runner-jar-with-dependencies.jar',
        'jacocoagent.jar',
        -- spring-boot
        'commons-lsp-extensions.jar',
        'xml-ls-extension.jar',
    }

    bundles = vim.tbl_filter(function(bundle)
        if not bundle then
            return false
        end
        local filename = vim.fn.fnamemodify(bundle, ':t')
        for _, ex in ipairs(excluded) do
            if filename == ex then
                return false
            end
        end
        return true
    end, bundles)

    return bundles
end

return {
    on_attach = function(_, bufnr)
        local jdtls = require('jdtls')
        vim.keymap.set('n', '<leader>dt', jdtls.test_nearest_method, {
            buffer = bufnr,
            desc = 'Debug Test Method',
        })
        vim.keymap.set('n', '<leader>dT', jdtls.test_class, {
            buffer = bufnr,
            desc = 'Debug Test Class',
        })
    end,

    flags = {
        debounce_text_changes = 80,
    },

    root_markers = { ".git", { "mvnw", "gradlew", "build.gradle", "build.gradle.kts" }, { "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" } },

    settings = {
        -- See: https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- Also see: https://github.com/redhat-developer/vscode-java/blob/d3bcbaa3f5a3097dc21b5d94132d6858a0452a7c/package.json#L273
        java = {
            configuration = { updateBuildConfiguration = 'automatic' },
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            format = { enabled = true },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            sources = { organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 }},
            codeGeneration = { useBlocks = true, generateComments = false },
        },
    },

    init_options = {
        -- TODO: These are debugging configurations, those should stay in debugger.lua
        bundles = get_mason_bundles(),
    },

    -- Old command, kept for reference
    -- cmd = {
    --     "java",
    --     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    --     '-Dosgi.bundles.defaultStartLevel=4',
    --     '-Declipse.product=org.eclipse.jdt.ls.core.product',
    --     '-Dlog.protocol=true',
    --     '-Dlog.level=ALL',
    --     '-Xmx4g',
    --     '--add-modules=ALL-SYSTEM',
    --     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    --     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    --     '-javaagent:' .. jdtls_path .. 'lombok.jar',
    --     '-jar', vim.fn.glob(jdtls_path .. 'plugins/org.eclipse.equinox.launcher_*.jar'),
    --     '-configuration', jdtls_path .. 'config_linux',
    --     '-data', workspace_folder,
    -- },
}
