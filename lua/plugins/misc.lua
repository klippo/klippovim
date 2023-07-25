return {
    { "folke/lazy.nvim", version = "*" },
    {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },

}
