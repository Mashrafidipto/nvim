return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require 'iron.core'

    iron.setup {
      config = {
        -- Whether iron should manage repl window creation and close
        close_window_on_exit = true,
        -- The window options for the REPL
        repl_open_cmd = require('iron.view').split.vertical(70),
      },
      -- Iron doesn't set keymaps by default; we define them below
      keymaps = {
        toggle_repl = '<space>rr', -- toggles the repl open and closed.
        restart_repl = '<space>rR', -- calls `IronRestart` to restart the repl
        send_motion = '<space>rs',
        visual_send = '<space>rs',
        send_file = '<space>rf',
        send_line = '<space>rl',
        clear = '<space>rc',
      },
      -- Define REPL behavior for specific languages
      repl_definition = {
        sh = {
          command = { 'zsh' },
        },
        julia = {
          command = { 'julia', '-q' },
        },
        python = {
          command = { 'python3' },
        },
      },
    }
  end,
}
