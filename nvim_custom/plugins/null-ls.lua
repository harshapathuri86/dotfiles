local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local ca = null_ls.builtins.code_actions
local d = null_ls.builtins.diagnostics
local f = null_ls.builtins.formatting
local h = null_ls.builtins.hover
local c = null_ls.builtins.completion

local sources = {

  -- webdev
  f.deno_fmt, -- choosed deno for ts/js files cuz its very fast!

  f.prettier.with { filetypes = { "html","json","css", "markdown", "yaml" } }, -- so prettier works only on these filetypes

  -- lua
  f.stylua,

  -- cpp
  -- d.cpplint,
  f.clang_format,

  -- python
  d.flake8,
  d.mypy,
  f.autopep8,

  -- web dev
  d.eslint_d,

  -- other
  ca.gitsigns,

  -- inbuilt
  d.todo_comments,
  d.trail_space,
  f.trim_newlines,
  f.trim_whitespace,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
