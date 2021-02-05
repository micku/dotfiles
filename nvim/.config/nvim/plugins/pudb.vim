" Nvim python environment settings
if has('nvim')
  "let g:python_host_prog='~/.virtualenvs/neovim2/bin/python'
  " set the virtual env python used to launch the debugger
  "let g:pudb_python='python3'
  " set the entry point (script) to use for pudb
  "let g:pudb_entry_point='~/src/poweruser_tools/test/test_templates.py'
  " Unicode symbols work fine (nvim, iterm, tmux, nyovim tested)
  let g:pudb_breakpoint_symbol='?'
endif
