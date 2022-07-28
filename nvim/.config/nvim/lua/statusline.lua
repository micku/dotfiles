local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

local bg = '#434c5e'
local lightbg = '#4c566a'
local fg = '#e5e9f0'
local darkfg = '#2e3440'
local red = '#bf616a'
local orange = '#d08770'
local yellow = '#ebcb8b'
local green = '#a3be8c'
local violet = '#b48ead'
local cyan = '#8fbcbb'
local darkblue = '#5e81ac'
local blue = '#88c0d0'

local magenta = '#c678dd'

gl.short_line_list = {'NvimTree','vista','dbui','packer','defx','lir'}

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = red, i = green,v=blue,
                          [''] = blue,V=blue,
                          c = magenta,no = red,s = orange,
                          S=orange,[''] = orange,
                          ic = yellow,R = violet,Rv = violet,
                          cv = red,ce=red, r = cyan,
                          rm = cyan, ['r?'] = cyan,
                          ['!']  = red,t = red}
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return '   '
    end,
    highlight = {bg,red},
    separator = ' ',
    separator_highlight = {bg,bg},
  },
}

gls.left[2] = {
  FilePath = {
    provider = 'FilePath',
    condition = condition.buffer_not_empty,
    highlight = {orange,bg}
  }
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,bg},
  },
}

gls.left[4] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {red,bg}
  }
}
gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {yellow,bg},
  }
}

gls.left[6] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {cyan,bg},
  }
}

gls.left[7] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {blue,bg},
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {cyan,lightbg}
  }
}

gls.right[1] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {violet,bg},
  }
}

gls.right[2] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {violet,bg},
  }
}

gls.right[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {green,bg},
  }
}
gls.right[4] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {orange,bg},
  }
}
gls.right[5] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {red,bg},
  }
}

gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {darkfg,violet},
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {blue,bg}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {fg,bg}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {fg,bg}
  }
}
