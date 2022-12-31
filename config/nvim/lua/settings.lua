local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd -- to execute vim commands
local g = vim.g -- a table to access global options


-- global options
o.inccommand = 'nosplit'
o.swf = true
o.dir = '/tmp'
o.scs = true
o.ic = true
o.scs = true
o.so = 12
o.ss = 5
o.lz = true
o.hid = true
o.js = false
o.showbreak="↪"
o.undofile = true
o.undodir = '/home/harsha/.cache/nvim/undodir'
o.undodir = '/home/harsha/.cache/nvim/undodir'
-- o.path = 'o.path + .,**'
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
]]
o.ch = 2
o.title = true
o.showmatch = true
o.mat = 2
o.ut = 250
o.sr = true
o.spr = true
o.sb = true
o.mouse = 'a'
o.tgc = true
o.lcs='tab:» ,nbsp:␣,trail:·,extends:❯,precedes:❮,eol:¬'
vim.o.completeopt = "menuone,noselect"

cmd('au TextYankPost * lua vim.highlight.on_yank{timeout=200}')

vim.opt.termguicolors = true
vim.g.onedark_terminal_italics = 2
o.background = 'dark'
vim.g.vscode_style = "dark"
vim.cmd [[colorscheme gruvbox]]

-- window-local options
wo.nu  = true
wo.rnu  = true
wo.wrap = false
wo.cc = "80"
wo.lbr = true
wo.spell = false
wo.list = true
-- wo.fdm= "indent"
-- wo.fdl = 10
wo.cul = true

-- buffer-local options
bo.et = true
bo.si = true
bo.ts = 4
bo.sts = 4
bo.sw = 4
bo.tw = 78
bo.undofile = true
-- bo.formatoptions = vim.o.formatoptions:gsub('o', '')
-- cmd('set formatoptions-=o')
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]


-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- restore cursor
cmd([[ au BufReadPost * call setpos(".", getpos("'\"")) ]])

-- augroups don't have an interface yet
-- u.create_augroup({
--     { 'BufRead,BufNewFile', '/tmp/nail-*', 'setlocal', 'ft=mail' },
--     { 'BufRead,BufNewFile', '*s-nail-*', 'setlocal', 'ft=mail' },
-- }, 'ftmail')

