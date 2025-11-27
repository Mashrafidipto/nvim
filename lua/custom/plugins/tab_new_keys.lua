-- In your init.lua or a dedicated keymaps file (e.g., lua/config/keymaps.lua)

-- Get the blink.cmp module
local blink_cmp = require 'blink.cmp'
local luasnip = require 'luasnip'
local neotab = require 'neotab'

vim.api.nvim_set_keymap(
  'i',
  '<Tab>',
  [[
  <C-r>=v:lua.SmartTab()<CR>
]],
  { expr = true, silent = true, desc = 'Smart Tab' }
)

vim.api.nvim_set_keymap(
  's',
  '<Tab>',
  [[
  <C-r>=v:lua.SmartTab()<CR>
]],
  { expr = true, silent = true, desc = 'Smart Tab (Snippet Select)' }
)

vim.api.nvim_set_keymap(
  'i',
  '<S-Tab>',
  [[
  <C-r>=v:lua.SmartShiftTab()<CR>
]],
  { expr = true, silent = true, desc = 'Smart Shift-Tab' }
)

vim.api.nvim_set_keymap(
  's',
  '<S-Tab>',
  [[
  <C-r>=v:lua.SmartShiftTab()<CR>
]],
  { expr = true, silent = true, desc = 'Smart Shift-Tab (Snippet Select)' }
)

function _G.SmartTab()
  if blink_cmp.visible() then
    -- If completion menu is visible, select next item
    return blink_cmp.select_next_item()
  elseif luasnip.expand_or_locally_jumpable() then
    -- If in a snippet and can expand or jump forward, do so
    return luasnip.expand_or_jump()
  elseif neotab.tabout() then
    -- If neotab can perform a "tabout", do it
    return '' -- neotab.tabout returns true on success, so we return empty string to stop mapping
  else
    -- Fallback: insert a regular tab (or spaces based on expandtab)
    return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
  end
end

function _G.SmartShiftTab()
  if blink_cmp.visible() then
    -- If completion menu is visible, select previous item
    return blink_cmp.select_prev_item()
  elseif luasnip.locally_jumpable(-1) then
    -- If in a snippet and can jump backward, do so
    return luasnip.jump(-1)
  else
    -- Fallback: insert a regular shift-tab (if configured for something specific)
    -- Or just do nothing, or perhaps try to "tabin" if neotab supported it
    return vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true)
  end
end
