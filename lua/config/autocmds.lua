-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "json", "jsonc", "markdown" },
--   callback = function()
--     vim.opt.conceallevel = 0
--   end,
-- })

-- Language-specific indentation settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    -- Go uses tabs for indentation
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "java" },
  callback = function()
    -- 4-space indentation
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "javascriptreact",
    "jsx",
    "typescript",
    "typescriptreact",
    "tsx",
    "yaml",
    "yml",
    "json",
    "jsonc",
    "lua",
    "markdown",
  },
  callback = function()
    -- 2-space indentation
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
