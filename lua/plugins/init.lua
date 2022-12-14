local present, packer = pcall(require, "plugins.packer")

if not present then
	return false
end

local plugins = {
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },

	{ "nathom/filetype.nvim" },
	{ "wbthomason/packer.nvim" },
	{ "saltstack/salt-vim" },
	{
		"nvim-treesitter/nvim-treesitter",
		--    event = { 'BufRead', 'BufNewFile' },
		run = ":TSUpdate",
	},
	--
	{ "klippo/nvim-base16.lua" },
	{ "andymass/vim-matchup" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "folke/trouble.nvim" },

	-- telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "nvim-telescope/telescope-ui-select.nvim" },

	{ "kyazdani42/nvim-tree.lua" },
	{ "akinsho/bufferline.nvim" },
	{ "goolord/alpha-nvim" },

	-- lsp
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },

	{ "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" },

	{ "hashivim/vim-terraform" },
	{ "hashivim/vim-packer" },

	{ "rafamadriz/friendly-snippets" },
	{
		"ahmedkhalf/project.nvim",
		requires = { "neovim/nvim-lspconfig" },
		config = function()
			require("project_nvim").setup({
				manual_mode = false,
				detection_methods = { "lsp", "pattern" },
				silent_chdir = true,
				show_hidden = true,
			})
		end,
	},

	{ "vladdoster/remember.nvim" },

	{ "ellisonleao/glow.nvim" },
	{ "windwp/nvim-spectre" },

	-- Git Tools
	{ "TimUntersberger/neogit" },
	{ "lewis6991/gitsigns.nvim" },
	{ "akinsho/git-conflict.nvim" },

	{ "preservim/vim-markdown" },
	{ "sudormrfbin/cheatsheet.nvim" },

	{ "NvChad/nvim-colorizer.lua" },

	{
		"anuvyklack/hydra.nvim",
		requires = "anuvyklack/keymap-layer.nvim", -- needed only for pink hydras
	},
	{ "jlanzarotta/bufexplorer" },
	{ "sindrets/winshift.nvim" },
	{ "chentoast/marks.nvim" },
	{ "klippo/zen-mode.nvim" },
	{ "folke/twilight.nvim" },

	{ "kylechui/nvim-surround" },
	{ "towolf/vim-helm" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "ray-x/go.nvim" },
	{ "ray-x/guihua.lua" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "folke/noice.nvim",
 	  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
	},
}

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
	require("plugins.configs")
end)
-- Lua
