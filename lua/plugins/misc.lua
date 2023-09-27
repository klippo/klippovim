return {
	{
		"towolf/vim-helm",
		lazy = false,
	},
	{ "folke/lazy.nvim", version = "*" },
	{
		"vladdoster/remember.nvim",
		config = function()
			require("remember")
		end,
	},
	{ "saltstack/salt-vim", lazy = false },
	{
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = false, -- "Name" codes like Blue
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					AARRGGBB = true, -- 0xAARRGGBB hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = false, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

					-- Available modes: foreground, background
					mode = "background", -- Set the display mode.
				},
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		lazy = false,
		config = function()
			require("mini.indentscope").gen_animation.exponential({ easing = "out", duration = 1000, unit = "total" })
			--  {
			-- draw = {
			-- 	delay = 0,
			-- },
			-- })
		end,
	},
}
