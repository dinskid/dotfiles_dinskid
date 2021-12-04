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

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'colorscheme OceanicNext'
cmd 'tnoremap <Esc> <C-\\><C-n>'
cmd 'map <C-V>       "+gP'
cmd 'cmap <C-V>      <C-R>+'
cmd 'let g:vsnip_snippet_dir = "~/.config/nvim/snippets/snippets"'

local au = require('au')
au.BufWritePre = function()
  vim.cmd 'Neoformat'
end

--
-- cmd "imap <expr> <Tab>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'"
-- cmd "smap <expr> <Tab>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'"
--
-- cmd "imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'"
-- cmd "smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'"
--
-- cmd "imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'"
-- cmd "smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'"
-- cmd "imap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'"
-- cmd "smap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'"
--
-- cmd "nmap        s   <Plug>(vsnip-select-text)"
-- cmd "xmap        s   <Plug>(vsnip-select-text)"
-- cmd "nmap        S   <Plug>(vsnip-cut-text)"
-- cmd "xmap        S   <Plug>(vsnip-cut-text)"
