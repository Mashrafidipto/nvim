return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local filetypes = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'zig' }
      require('nvim-treesitter').install(filetypes)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- enable this plugin (can be enabled/disabled later via commands)
        throttle = true, -- throttles plugin updates (may improve performance)
        max_lines = 1, -- how many lines the window should span. values <= 0 mean no limit.
        patterns = { -- match patterns for ts nodes. these get wrapped to match at word boundaries.
          default = {
            'function',
            'method',
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
