return {
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {}
      -- vim.cmd [[colorscheme everforest]]
    end,
  },
  -- {
  --   'p00f/alabaster.nvim',
  --   -- version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     -- require('alabaster.nvim').setup {}
  --     -- vim.cmd [[colorscheme alabaster]]
  --   end,
  -- },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        theme = 'wave',
      }
      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
