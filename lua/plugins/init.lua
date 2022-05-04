local present, packer = pcall(require, 'plugins.packer')

if not present then
  return false
end

local plugins = {
  { 'kyazdani42/nvim-web-devicons' },
  { 'nvim-lua/plenary.nvim' },
  { 'lewis6991/impatient.nvim' },

  { 'nathom/filetype.nvim' },
  { 'wbthomason/packer.nvim' },
  { 'saltstack/salt-vim' },
  {
    'nvim-treesitter/nvim-treesitter',
--    event = { 'BufRead', 'BufNewFile' },
    run = ':TSUpdate'
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  { 'klippo/nvim-base16.lua' },
  { 'numToStr/Comment.nvim', },
  { 'andymass/vim-matchup' },
  { 'windwp/nvim-autopairs' },

  -- telescope
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  { 'kyazdani42/nvim-tree.lua' },
  { 'akinsho/bufferline.nvim' },
  { 'goolord/alpha-nvim' },
  -- lsp
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'psliwka/vim-dirtytalk', run = ':DirtytalkUpdate' },

  { 'folke/trouble.nvim' },
  { 'hashivim/vim-terraform' },
  { 'hashivim/vim-packer' },
  { 'rafamadriz/friendly-snippets' },
  { 'ahmedkhalf/project.nvim',
    requires = { 'neovim/nvim-lspconfig' },
    config = function()
      require('project_nvim').setup({
        manual_mode = false,
        detection_methods = { 'lsp', 'pattern' },
        silent_chdir = true,
        show_hidden = true,
      })
    end
  },
  -- { 'stevearc/dressing.nvim' },

  { 'vladdoster/remember.nvim' },

  { 'ellisonleao/glow.nvim' },
  { 'windwp/nvim-spectre' },

  -- Git Tools
  { 'kdheepak/lazygit.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'akinsho/git-conflict.nvim' },

  { 'sudormrfbin/cheatsheet.nvim' }

}


return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
  require('plugins.configs')
end)
