local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('n', '<leader>.', '<cmd>lua require("telescope.builtin").find_files{ file_ignore_patterns = { "node_modules", ".git" }}<cr>')
utils.map('n', '<leader>p', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<cr>')
utils.map('n', '<leader>Tg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>,', '<cmd>Telescope buffers<cr>')
utils.map('n', '<leader>Th', '<cmd>Telescope help_tags<cr>')
utils.map('n', '<leader>q', '<cmd>q!<cr>')
utils.map('n', '<leader>y', '<cmd>:%y+<cr>')
utils.map('n', '<leader>t', '<cmd>FloatermToggle<cr>')
utils.map('n', '<leader>s', '<cmd>NERDTreeToggle<cr>')
utils.map('n', '<C-n>', '<cmd>lua NewFile()<cr>')
utils.map('n', '<F6>', '<cmd>lua compileSubmitRun()<cr>')
utils.map('n', '<F5>', '<cmd>lua compileRun()<cr>')
utils.map('n', '<F4>', '<cmd>lua full()<cr>')

utils.map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").file_browser{cwd = vim.fn.expand("%:p:h")}<cr>')

utils.map('n', '<leader>hh', '<C-w>h')
utils.map('n', '<leader>jj', '<C-w>j')
utils.map('n', '<leader>kk', '<C-w>k')
utils.map('n', '<leader>ll', '<C-w>l')
utils.map('n', '<leader>f', '<cmd>:Telescope zoxide list<cr>')

utils.map('n', '<leader>;', ':cd $HOME/.config/nvim/<CR> :e $MYVIMRC<CR>')
utils.map('n', '<leader><CR>', ':lcd %:p:h<cr>')

utils.map("x", "J", ":move '>+1<CR>gv-gv")
utils.map("x", "K", ":move '<-2<CR>gv-gv")
utils.map("x", "<A-j>", ":move '>+1<CR>gv-gv")
utils.map("x", "<A-k>", ":move '<-2<CR>gv-gv")
