--Set leader key
vim.g.mapleader = " "

-- Set basic options
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Fonts
vim.opt.guifont = { "JetBrainsMono:h16" }

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


-- Vimtex stuff
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local f = io.open("/tmp/vimtexserver.txt", "w")
    if f then
      f:write(vim.v.servername)
      f:close()
    end
  end,
})
-- More vimtex stuff
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex"
  end,
})


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
        },
      }) 
      vim.cmd("colorscheme onedark")
    end,
  },

  -- Tree-sitter with Dart
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "javascript",
        "dart",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
{
  "lervag/vimtex",
  ft = { "tex", "latex" },
  init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_general_viewer = "skim"
    vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_compiler_method = "latexmk"
    print(">> loaded VimTeX config!")
  end,
},
})
