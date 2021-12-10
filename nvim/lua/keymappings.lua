local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('n', '<leader>.', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>,', '<cmd>Telescope buffers<cr>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
utils.map('n', '<leader>pp', '<cmd>Telescope file_browser<cr>')
utils.map('n', '<leader>q', '<cmd>q!<cr>')
utils.map('n', '<leader>y', '<cmd>:%y+<cr>')
utils.map('n', '<leader>t', '<cmd>FloatermToggle<cr>')
utils.map('n', '<leader>s', '<cmd>NERDTreeToggle<cr>')
utils.map('n', '<C-n>', '<cmd>Alpha<cr>')
utils.map('n', '<F5>', '<cmd>lua compileRun()<cr>')
utils.map('n', '<F4>', '<cmd>lua full()<cr>')

utils.map('n', '<leader>hh', '<C-w>h')
utils.map('n', '<leader>jj', '<C-w>j')
utils.map('n', '<leader>kk', '<C-w>k')
utils.map('n', '<leader>ll', '<C-w>l')
utils.map('n', '<leader>ff', '<cmd>:Telescope zoxide list<cr>')

utils.map('n', '<leader>;', ':cd $HOME/.config/nvim/<CR> :e $MYVIMRC<CR>')
utils.map('n', '<leader><CR>', ':lcd %:p:h<cr>')

