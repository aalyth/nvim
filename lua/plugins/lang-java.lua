return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local function get_bundles()
      local mason_data = vim.fn.stdpath("data") .. "/mason/packages"
      local bundles = {}

      -- java-debug-adapter
      local debug_jar = vim.fn.glob(mason_data .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
      if debug_jar ~= "" then
        vim.list_extend(bundles, vim.split(debug_jar, "\n", { trimempty = true }))
      end

      -- vscode-java-test
      local test_jars = vim.fn.glob(mason_data .. "/vscode-java-test/extension/server/*.jar")
      if test_jars ~= "" then
        vim.list_extend(bundles, vim.split(test_jars, "\n", { trimempty = true }))
      end

      return bundles
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local jdtls = require("jdtls")
        local mason_data = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
        local os_config   = vim.uv.os_uname().sysname == "Darwin" and "config_mac" or "config_linux"

        local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/"
          .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        local config = {
          cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", vim.fn.glob(mason_data .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
            "-configuration", mason_data .. "/" .. os_config,
            "-data", workspace,
          },
          root_dir = jdtls.setup.find_root({ "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" }),
          settings = {
            java = {},
          },
          init_options = {
            bundles = get_bundles(),
          },
          on_attach = function(client, bufnr)
            _G.shared_on_attach(client, bufnr)
            jdtls.setup_dap({ hotcodereplace = "auto" })

            local map = function(lhs, rhs, desc)
              vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
            end
            map("<leader>jo", jdtls.organize_imports,                    "Organize imports")
            map("<leader>jv", jdtls.extract_variable,                    "Extract variable")
            map("<leader>jm", jdtls.extract_method,                      "Extract method")
            map("<leader>jt", "<cmd>JdtCompile<cr>",                     "Compile")
            map("<leader>jT", function() require("jdtls.tests").run() end, "Run tests")
          end,
          capabilities = _G.shared_capabilities,
        }

        jdtls.start_or_attach(config)
      end,
    })
  end,
}
