require('config.cmp')
require('config.lsp')
require('config.greet')
require('config.telescope')
require('config.lualine')

-- single line configs
require('luasnip.loaders.from_vscode')
    .load({ paths = { "/home/dinskid/.config/dotfiles_dinskid/nvim/snippets" } })
