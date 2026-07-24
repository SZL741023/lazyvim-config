return {
  -- 只補 LazyVim extras 沒涵蓋的 formatter / linter
  -- (typescript / python / tailwind / json / yaml / java 等 server 已由 lazyvim.json 的 extras 自動安裝設定)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
      })
    end,
  },

  -- 客製化的 server 設定：pyright 關閉型別檢查、忽略特定診斷
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          init_options = {
            diagnosticSeverity = "Hint",
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off", -- 關閉型別檢查
                autoSearchPaths = true, -- 自動搜尋依賴路徑
                useLibraryCodeForTypes = true, -- 使用庫的型別檢查
                diagnosticSeverityOverrides = { -- 覆蓋特定診斷錯誤
                  reportOptionalMemberAccess = "none", -- 忽略可選成員存取錯誤
                  reportOptionalSubscript = "none", -- 忽略索引錯誤
                  reportUnboundVariable = "none", -- 忽略未綁定變數錯誤
                  reportUnusedVariable = "none", -- 忽略未使用變數警告
                  reportUnusedImport = "none", -- 忽略未使用引入警告
                },
              },
            },
          },
        },
      },
    },
  },

  -- 自訂 gd：跳到定義時不重用視窗
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        {
          "gd",
          function()
            -- DO NOT REUSE WINDOW
            require("telescope.builtin").lsp_definitions({ reuse_win = false })
          end,
          desc = "Goto Definition",
          has = "definition",
        },
      })
    end,
  },
}
