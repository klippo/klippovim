return {
	{ "folke/lazy.nvim", version = "*" },
	{
		"vladdoster/remember.nvim",
		config = function()
			require("remember")
		end,
	},
}
