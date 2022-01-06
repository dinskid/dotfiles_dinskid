require'telescope'.setup {
  pickers = {
    find_files = {
      theme = 'ivy'
    },
    file_browser = {
      theme = 'ivy',
    },
  },
}

require'telescope'.load_extension('zoxide')
require'telescope'.load_extension('media_files')
require'telescope'.load_extension('project')
require'telescope'.load_extension('file_browser')

