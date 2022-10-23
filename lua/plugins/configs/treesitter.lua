local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "python", "hcl", "bash", "yaml", "json", "java", "html", "go", "css" },
  autotag = {
    enable = true,
    filetypes = {
      "html",
    },
  },
  highlight = { enable = true,
    disable = {
      "yaml",
    },
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
