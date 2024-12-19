return {
  {
    "rolv-apneseth/tfm.nvim",
    name = "tfm",
    lazy = false,
    opts = {
      file_manager = "yazi",
      enable_cmds = true,
      keybindings = {
        -- ["<ESC>"] = "q",
      },
      -- replace_netrw = true,
    },
    keys = {
      -- Make sure to change these keybindings to your preference,
      -- and remove the ones you won't use
      {
        "<leader>t",
        -- ":Tfm<CR>",
        function()
          local is_buf_empty = vim.fn.empty(vim.fn.expand("%:t")) == 1
          local path = nil
          if is_buf_empty then
            -- get current buffer folder
            path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
          else
            -- buf not empty, have file opened
            path = vim.fn.expand("%:p")
          end
          -- local cwd = vim.fn.getcwd()
          require("tfm").select_file_manager("yazi")
          require("tfm").open(path)
        end,
        desc = "tfm",
      },
      {
        "<leader>mh",
        ":TfmSplit<cr>",
        desc = "tfm - horizontal split",
      },
      {
        "<leader>mv",
        ":TfmVsplit<cr>",
        desc = "tfm - vertical split",
      },
      {
        "<leader>mt",
        ":TfmTabedit<cr>",
        desc = "tfm - new tab",
      },
    },
  },
}
