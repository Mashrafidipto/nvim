return {
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        background = 'hard',
        transparent_background_level = 1,
        italics = true,
        disable_italic_comments = false,
        -- inlay_hints_background = 'dimmed',
      }
      -- vim.cmd 'colorscheme everforest'
    end,
  },
  {
    'p00f/alabaster.nvim',
    -- version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      -- require('alabaster.nvim').setup {}
      -- vim.cmd [[colorscheme alabaster]]
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = true, -- enable compiling the colorscheme
        transparent = true, -- do not set background color
        dimInactive = true,
        theme = 'dragon',
      }
      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
