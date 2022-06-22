local merge_tb = require('core.utils').merge_tb

local highlights = {}
local hl_dir = vim.fn.stdpath "config" .. "/lua/colors/integrations"
local hl_files = require("plenary.scandir").scan_dir(hl_dir, {})

for _, file in ipairs(hl_files) do
   local a = vim.fn.fnamemodify(file, ":t")
   a = vim.fn.fnamemodify(a, ":r")

   local integration = require("colors.integrations." .. a)
   highlights = merge_tb(highlights, integration)
end

for hl, col in pairs(highlights) do
   vim.api.nvim_set_hl(0, hl, col)
end





local present, lualine = pcall(require, "lualine")
if present then
  local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed
      }
    end
  end

  lualine.setup {
    options = {
      theme = 'onedark',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
  }
end

-- require 'colors.highlights'
