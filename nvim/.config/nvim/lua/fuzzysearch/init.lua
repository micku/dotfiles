local cmd = vim.cmd
local g = vim.g

g.fzf_command_prefix = 'Fzf'
g.fzf_preview_window = {'right:50%', 'ctrl-/'}

cmd 'command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, {"options": "--delimiter : --nth 4.."}, <bang>0)'
