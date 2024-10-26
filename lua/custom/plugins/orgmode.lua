return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      if vim.fn.has 'linux' then
        require('orgmode').setup {
          org_agenda_files = '~/org/**/*',
          org_default_notes_file = '~/org/refile.org',
        }
      else
        require('orgmode').setup {
          org_agenda_files = [[D:/org/**/*]],
          org_default_notes_file = [[D:/org/refile.org]],
        }
      end
    end,
  },
  {
    'nvim-orgmode/telescope-orgmode.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-orgmode/orgmode',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'orgmode'

      vim.keymap.set('n', '<leader>r', require('telescope').extensions.orgmode.refile_heading)
      vim.keymap.set('n', '<leader>fh', require('telescope').extensions.orgmode.search_headings)
      vim.keymap.set('n', '<leader>li', require('telescope').extensions.orgmode.insert_link)
    end,
  },
}
