require('dashboard').setup {
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '  ⢸⣦⡈⠻⣿⣿⣿⣶⣄',
      '    ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣷⣄',
      '⣀⣀⣀⣀⣀⣀⣼⣿⣿⣿⣿ ⠈⠻⣿⣿⣿⣷⣄',
      '  ⠈⠻⣿⣿⣿⣿⣿⡿⠿⠛⠁   ⠈⠻⢿⣿⣿⣷⣄',
      '',
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'New file                       ',
        desc_hl = 'String',
        key = 'n',
        action = 'enew',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find file',
        desc_hl = 'String',
        key = 'f',
        action = 'Telescope find_files',
        keymap = 'SPC f',
        key_hl = 'Number',
        key_format = ' %s',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Recent files',
        desc_hl = 'String',
        key = 'h',
        action = 'Telescope oldfiles',
        keymap = 'SPC h',
        key_hl = 'Number',
        key_format = ' %s',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find Word',
        desc_hl = 'String',
        key = 'g',
        action = 'Telescope live_grep',
        keymap = 'SPC g',
        key_hl = 'Number',
        key_format = ' %s',
      },
    },
    footer = {},
  }
}

-- vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
-- vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
-- vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
-- vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
