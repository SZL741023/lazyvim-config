return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },

  config = function(_, opts)
    require("jdtls").start_or_attach(opts)
  end,

  opts = function()
    local home = vim.env.HOME
    -- ⬇️ 改成你機器上的實際 JDK 路徑（用 `/usr/libexec/java_home -V` 查）
    -- local JAVA_21_HOME = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
    -- local JAVA_17_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
    local JAVA_21_HOME = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
    -- Mason 安裝位置
    local mason = vim.fn.stdpath("data") .. "/mason"
    local jdtls_pkg = mason .. "/packages/jdtls"

    -- 尋找 equinox launcher JAR
    local launcher_glob = jdtls_pkg .. "/plugins/org.eclipse.equinox.launcher_*.jar"
    local launcher_jar = vim.fn.glob(launcher_glob)
    if launcher_jar == "" then
      vim.notify("[jdtls] equinox launcher JAR not found under " .. launcher_glob, vim.log.levels.ERROR)
    end

    -- 選擇對應 OS 的 jdtls config（macOS=mac；Linux=linux；Windows=win）
    local os_config
    if vim.fn.has("mac") == 1 then
      os_config = "config_mac"
    elseif vim.fn.has("unix") == 1 then
      os_config = "config_linux"
    elseif vim.fn.has("win32") == 1 then
      os_config = "config_win"
    else
      os_config = "config_mac"
    end
    local jdtls_config_dir = jdtls_pkg .. "/" .. os_config

    -- 每個專案一個 workspace
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

    -- 直接用 Java 21 的 java 執行（完全繞過 PATH/jenv）
    local java21 = JAVA_21_HOME .. "/bin/java"

    -- 這些是 jdtls 官方啟動參數（維持預設）
    local cmd = {
      java21,
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      launcher_jar,
      "-configuration",
      jdtls_config_dir,
      "-data",
      workspace_dir,
    }

    local bundles = {}
    local function add_bundles(glob)
      local matches = vim.split(vim.fn.glob(glob), "\n")
      if matches[1] ~= "" then
        for _, jar in ipairs(matches) do
          table.insert(bundles, jar)
        end
      end
    end
    add_bundles(mason .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
    add_bundles(mason .. "/packages/java-test/extension/server/*.jar")

    return {
      cmd = cmd,
      -- 再保險：也把 JAVA_HOME 指向 21（某些外掛會讀）
      cmd_env = {
        JAVA_HOME = JAVA_21_HOME,
        PATH = JAVA_21_HOME .. "/bin:" .. vim.env.PATH,
      },

      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }) or vim.fn.getcwd(),

      -- ✅ 保留你原本的 settings，並鎖專案為 Java 17 相容
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = JAVA_21_HOME,
                default = true,
              },
              -- {
              --   name = "JavaSE-17",
              --   path = JAVA_17_HOME,
              -- },
            },
          },
          project = {
            target = "17",
            source = "17",
          },
        },
      },
      init_options = {
        bundles = bundles,
      },

      on_attach = function(_, bufnr)
        local jdtls = require("jdtls")
        jdtls.setup_dap({ hotcodereplace = "auto" })
        local ok_dap, jdtls_dap = pcall(require, "jdtls.dap")
        if ok_dap then
          jdtls_dap.setup_dap_main_class_configs()
        else
          vim.notify("[jdtls] jdtls.dap not available; skipping main class DAP configs", vim.log.levels.WARN)
        end
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true })
        end
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "K", vim.lsp.buf.hover)
      end,
    }
  end,
}
