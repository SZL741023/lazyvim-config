return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- vim.keymap.set("n", "<leader>dc", function()
      --   dap.continue()
      -- end)
      -- vim.keymap.set("n", "<leader>db", function()
      --   dap.set_breakpoint()
      -- end)
      vim.keymap.set("n", "<leader>dc", dap.continue, {})
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})

    end,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local function get_python_path()
        -- 1. 已啟動的 venv（terminal 裡 source activate 過的）
        local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        if venv then
          return venv .. "/bin/python"
        end

        -- 2. 從 cwd 往上找常見 venv 目錄
        local cwd = vim.fn.getcwd()
        for _, dir in ipairs({ ".venv", "venv", ".virtualenv", "env" }) do
          local candidate = cwd .. "/" .. dir .. "/bin/python"
          if vim.fn.executable(candidate) == 1 then
            return candidate
          end
        end

        -- 3. Fallback: 系統 python3
        return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
      end

      require("dap-python").setup(get_python_path())
    end,
  },
  -- {
  --   "theHamsta/nvim-dap-virtual-text",
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require("nvim-dap-virtual-text").setup()
  --   end,
  -- },
}
