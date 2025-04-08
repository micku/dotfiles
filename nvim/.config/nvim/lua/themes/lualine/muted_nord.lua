local colors = {
  nord0  = "#2E3440",
  nord4  = "#D8DEE9",
  nord6  = "#ECEFF4",
  nord7  = "#8FBCBB",
  nord8  = "#88C0D0",
  nord11 = "#BF616A",
  nord12 = "#D08770",
  nord13 = "#EBCB8B",
  nord14 = "#A3BE8C",
  nord15 = "#B48EAD",
}

return {
  normal = {
    a = { fg = colors.nord14, bg = colors.nord0, gui = "bold" },
    b = { fg = colors.nord4, bg = colors.nord0 },
    c = { fg = colors.nord4, bg = colors.nord0 },
    z = { fg = colors.nord4, bg = colors.nord0 },
  },
  insert = {
    a = { fg = colors.nord13, bg = colors.nord0, gui = "bold" },
    z = { fg = colors.nord4, bg = colors.nord0 },
  },
  visual = {
    a = { fg = colors.nord12, bg = colors.nord0, gui = "bold" },
    z = { fg = colors.nord4, bg = colors.nord0 },
  },
  replace = {
    a = { fg = colors.nord11, bg = colors.nord0, gui = "bold" },
    z = { fg = colors.nord4, bg = colors.nord0 },
  },
  command = {
    a = { fg = colors.nord15, bg = colors.nord0, gui = "bold" },
    z = { fg = colors.nord4, bg = colors.nord0 },
  },
  inactive = {
    a = { fg = colors.nord8, bg = colors.nord0, gui = "bold" },
    b = { fg = colors.nord4, bg = colors.nord0 },
    c = { fg = colors.nord4, bg = colors.nord0 },
    z = { fg = colors.nord4, bg = colors.nord0 },
  },
}
