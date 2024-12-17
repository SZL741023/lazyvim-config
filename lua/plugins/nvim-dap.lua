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
      -- require("dap-python").setup("/Users/aotselin/.virtualenv/python_backend/bin/python") -- python backed virtualenv
      require("dap-python").setup("/Users/aotselin/.virtualenv/flytekit//bin/python") -- flytekit virtualenv
      -- require("dap-python").setup("/opt/homebrew/bin/python3.11") -- 可替換為你虛擬環境的 Python 路徑
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
