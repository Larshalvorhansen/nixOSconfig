-- Set leader key
vim.g.mapleader = " "

-- Set basic options
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  -- One Dark Pro Theme
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Load first
    config = function()
      require("onedarkpro").setup({
        colors = {
          bg = "#000000", -- Force black background
        },
        options = {
          transparency = true,
        }
      })
      vim.cmd("colorscheme onedark") -- Choose "onedark", "onedark_dark", "onedark_vivid", or "onedark_pro"
    end
  },
})
