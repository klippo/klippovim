local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "python", "hcl", "bash", "yaml", "json", "java", "html", "go" },
  autotag = {
    enable = true,
    filetypes = {
      "html",
    },
  },
  highlight = { enable = true,
  disable = {
    "yaml",
  }
},
matchup = {
  enable = true,              -- mandatory, false will disable the whole extension
},
}
-- end
