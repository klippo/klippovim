-- utility functions
local M = {}
local cmd = vim.cmd

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end
-- Highlights functions

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

M.merge_tb = function(t1, t2)
  return vim.tbl_deep_extend("force", t1, t2)
end

M.keymap = function(mode, key, cmd)
    vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true })
end

M.get_colors = function(type)
   local name

   -- if vim.g.nvchad_theme then
   --    name = vim.g.nvchad_theme
   -- else
   --    name = require("core.utils").load_config().ui.theme
   --    vim.g.nvchad_theme = name
   -- end

   -- theme paths
   local present, default_theme = pcall(require, "colors.themes.onedark")

   if present then
      return default_theme[type]
   else
      error "No such theme bruh >_< "
   end
end



return M
