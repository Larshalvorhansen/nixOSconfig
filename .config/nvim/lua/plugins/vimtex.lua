return {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_general_viewer = "skim"
    vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_compiler_method = "latexmk"
    print(">> loaded VimTeX config!")
  end,
}
