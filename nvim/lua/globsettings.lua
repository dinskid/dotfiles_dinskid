local utils = require('utils')
local cmd = vim.cmd
local indent = 2
cmd 'filetype plugin indent on'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'guifont', 'Fira Code:h11')
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'wrap', false)
utils.opt('o', 'signcolumn', 'yes')
utils.opt('o', 'hlsearch', false)
utils.opt('o', 'foldmethod', 'marker')

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'colorscheme OceanicNext'
cmd 'tnoremap <Esc> <C-\\><C-n>'

cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'

