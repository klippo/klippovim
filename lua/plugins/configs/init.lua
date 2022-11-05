-- require('plugins.configs.telescope').setup()
-- require('plugins.configs.nvimtree').setup()
-- require('project_nvim').setup()
local plugin_configs = {
  "alpha",
  "bufferline",
  "colorizer",
  "gitsigns",
  "lspconfig",
  "hydra",
  "null_ls",
  "nvimtree",
  "telescope",
  "zen-mode",
  "treesitter",
}
for _, pc in pairs(plugin_configs) do
  require('plugins.configs.' .. pc)

end

require('Comment').setup()
require('marks').setup()
-- require('dressing').setup()
require('git-conflict').setup()
require('nvim-autopairs').setup {}
require('nvim-autopairs').setup {}
require('remember')
require('trouble').setup()
require("nvim-surround").setup()
