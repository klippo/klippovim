return {
  {
    "towolf/vim-helm",
    lazy = false
  },
  { "folke/lazy.nvim",   version = "*" },
  {
    "vladdoster/remember.nvim",
    config = function()
      require("remember")
    end,
  },
  { "saltstack/salt-vim" },
}
