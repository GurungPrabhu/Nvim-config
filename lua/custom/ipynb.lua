local M = {}

M.create_ipynb = function(filename, rel_path)
  if filename == nil or filename == "" then
    print "Please provide a file name"
    return
  end

  if not filename:match "%.ipynb$" then filename = filename .. ".ipynb" end

  -- Build full path
  local base_dir = vim.fn.getcwd()
  local full_dir = rel_path and (base_dir .. "/" .. rel_path) or base_dir

  -- Create directory if it doesn't exist
  if vim.fn.isdirectory(full_dir) == 0 then vim.fn.mkdir(full_dir, "p") end

  local path = full_dir .. "/" .. filename

  local template = [[
{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "print(\"HELLO AWESOME\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "name": "python3",
   "display_name": "Python 3",
   "language": "python"
  },
  "language_info": {
   "name": "python",
   "version": "3.10"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
]]

  -- Jupyter Notebook template with one code cell
  if vim.fn.filereadable(path) == 1 then
    print("File already exists: " .. path)
    return
  end

  local f = io.open(path, "w")
  if f then
    f:write(template)
    f:close()
    print("Created notebook: " .. path)
  else
    print("Error creating file: " .. path)
  end
end

-- Update command to accept two arguments
vim.api.nvim_create_user_command("CreateIpynb", function(opts)
  local args = vim.split(opts.args, " ")
  M.create_ipynb(args[1], args[2])
end, { nargs = "+" })

return M
