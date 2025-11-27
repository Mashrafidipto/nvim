-- In your plugins/init.lua or a separate file for lazy.nvim
return {
  -- neotab.nvim for tabout functionality
  {
    'kawre/neotab.nvim',
    dependencies = {
      'L3MON4D3/LuaSnip', -- neotab can integrate with LuaSnip
    },
    config = function()
      require('neotab').setup {
        -- Default: tabkey = '<Tab>'
        -- Default: act_as_tab = true (will insert a regular tab/spaces if no pair is found)
        -- You can customize other options here as needed
      }
    end,
    -- Ensure it loads before blink.cmp to allow proper keymap overriding
    event = 'InsertEnter',
  },
}
