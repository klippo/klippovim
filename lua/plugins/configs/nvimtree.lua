-- globals must be set prior to requiring nvim-tree to function
local g = vim.g



local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local default = {
  actions = {
    open_file = {
      resize_window = true
    }
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  renderer = {
    root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },

    icons = {
      glyphs = {
        default = "",
        symlink = "",

        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
      }
    }
  }
}


nvimtree.setup(default)
