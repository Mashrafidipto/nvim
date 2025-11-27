return {
  {
    'vladdoster/remember.nvim',
    config = [[ require('remember') ]],
  },
  {
    'mluders/comfy-line-numbers.nvim',
    event = 'UIEnter', -- Load after entering neovim
    config = function()
      require('comfy-line-numbers').setup()
    end,
  },
}
