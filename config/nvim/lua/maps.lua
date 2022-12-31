local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local M = {}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Key mappings
map("i", "jk", "<esc>", {noremap = true})

map("n", "k", "gk", {noremap = true})
map("n", "gk", "k", {noremap = true})
map("n", "j", "gj", {noremap = true})
map("n", "gj", "j", {noremap = true})

map("t", "<esc>", ":<C-\\><C-n>", {noremap = true})

map("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", {noremap = true})



options = { noremap = true, silent = true }
map('n', '//', ':nohlsearch<cr>', options)

map("n", "<leader>n", ":NvimTreeToggle<CR>", {noremap = true})

-- Not an editor command: Wqa :)
cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa wqa')
cmd(':command! W w')
cmd(':command! Q q')

-- lspconfig
function M.on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', options)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
end

-- completion-nvim
-- FIXME: rewrite this in Lua
vim.api.nvim_exec([[
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
]], false)


return M
