local cmd = vim.cmd
local g = vim.g

function _G.init_fern()
  local api = vim.api

  -- Unmap maps used for mobility
  api.nvim_buf_del_keymap(0, '', '<C-h>')
  api.nvim_buf_del_keymap(0, '', '<C-l>')
  api.nvim_buf_del_keymap(0, '', '<C-j>')
  api.nvim_buf_del_keymap(0, '', '<C-k>')

  -- Mark files with space
  api.nvim_buf_set_keymap(0, 'n', ' ', '<Plug>(fern-action-mark)', {})

  -- l should expand, collapse or open
  api.nvim_buf_set_keymap(0, 'n', '<Plug>(fern-expand-or-collapse)', 'fern#smart#leaf("<Plug>(fern-action-open)", "<Plug>(fern-action-expand)", "<Plug>(fern-action-collapse)")', {expr = true})
  --nmap <buffer><nowait> l <Plug>(fern-expand-or-collapse)
  api.nvim_buf_set_keymap(0, 'n', 'l', '<Plug>(fern-expand-or-collapse)', {})

  -- When the tree changes, change the tab cd
  api.nvim_buf_set_keymap(0, 'n', '<Plug>(fern-action-leave-and-tcd)', '<Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)', {})
  api.nvim_buf_set_keymap(0, 'n', '-', '<Plug>(fern-action-leave-and-tcd)', {})

  -- Manually change cd
  api.nvim_buf_set_keymap(0, 'n', 'cd', '<Plug>(fern-action-tcd:cursor)', {})

  -- Open node with 'o'
  api.nvim_buf_set_keymap(0, 'n', 'o', '<Plug>(fern-action-open-or-expand)', {})
end

g['fern#renderer'] = "nerdfont"
cmd([[
  augroup fern-custom
    autocmd! *
    autocmd FileType fern call v:lua.init_fern()
  augroup END
]])
