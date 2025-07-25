local M = {}

--- Load all Lua files in a subdirectory relative to the calling source file.
-- @param relative_subdir string: Directory name relative to the caller's path.
function M.load_lua_files(relative_subdir)
  -- Get the caller's file path (the file that invoked this function)
  local info = debug.getinfo(2, "S") -- level 2: caller of this function
  local source = info and info.source
  if not source or not source:match("^@") then
    vim.notify("Could not determine caller source path", vim.log.levels.ERROR)
    return
  end

  local caller_file = source:sub(2) -- strip leading "@"
  local caller_dir = caller_file:match("(.*/)") -- extract directory

  if not caller_dir then
    vim.notify("Could not determine caller directory", vim.log.levels.ERROR)
    return
  end

  local dir = caller_dir .. relative_subdir
  local scan = vim.loop.fs_scandir(dir)
  if not scan then
    vim.notify("Directory not found: " .. dir, vim.log.levels.WARN)
    return
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(scan)
    if not name then break end
    if type == "file" and name:sub(-4) == ".lua" then
      local full_path = dir .. "/" .. name
      local ok, err = pcall(dofile, full_path)
      if not ok then
        vim.notify("Error loading " .. full_path .. ":\n" .. err, vim.log.levels.ERROR)
      end
    end
  end
end

return M
