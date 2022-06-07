local theme = require("core.utils").get_colors "base_16"

return {

  GitConflictCurrentLabel = {
    bg = theme.base0B,
    fg = theme.base00,
    bold = true,
  },
  GitConflictCurrent = {
    bg = theme.base00,
  },
  GitConflictIncomingLabel = {
    bg = theme.base09,
    fg = theme.base00,
    bold = true,
  },
  GitConflictIncoming = {
    bg = theme.base01,
  },
  GitConflictAncestorLabel = {
    bg = theme.base09,
    fg = theme.base00,
    bold = true,
  },
  GitConflictAncestor = {
    bg = theme.base04,
  },
   -- git commits
   gitcommitOverflow = {
      fg = theme.base08,
   },

   gitcommitSummary = {
      fg = theme.base08,
   },

   gitcommitComment = {
      fg = theme.base03,
   },

   gitcommitUntracked = {
      fg = theme.base03,
   },

   gitcommitDiscarded = {
      fg = theme.base03,
   },

   gitcommitSelected = {
      fg = theme.base03,
   },

   gitcommitHeader = {
      fg = theme.base0E,
   },

   gitcommitSelectedType = {
      fg = theme.base0D,
   },

   gitcommitUnmergedType = {
      fg = theme.base0D,
   },

   gitcommitDiscardedType = {
      fg = theme.base0D,
   },

   gitcommitBranch = {
      fg = theme.base09,
      bold = true,
   },

   gitcommitUntrackedFile = {
      fg = theme.base0A,
   },

   gitcommitUnmergedFile = {
      fg = theme.base08,
      bold = true,
   },

   gitcommitDiscardedFile = {
      fg = theme.base08,
      bold = true,
   },

   gitcommitSelectedFile = {
      fg = theme.base0B,
      bold = true,
   },
}
