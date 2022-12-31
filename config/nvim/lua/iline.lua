vim.opt.termguicolors = true
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_foldtext = true
vim.g.indent_blankline_disable_with_nolist = true
vim.g.indent_blankline_viewport_buffer = 20

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_end_of_line = true,
  show_current_context = true,
}

