-- require('plugins.configs.telescope').setup()
-- require('plugins.configs.nvimtree').setup()
-- require('project_nvim').setup()
local plugin_configs = {
  "telescope",
  "nvimtree",
  "gitsigns",
  "lspconfig",
  "bufferline",
  "treesitter",
  "alpha"
}
for _, pc in pairs(plugin_configs) do
  require('plugins.configs.' .. pc)

end

require('Comment').setup()
-- require('dressing').setup()
require('git-conflict').setup()
require('nvim-autopairs').setup {}
require('nvim-autopairs').setup {}
require('remember')
require('trouble').setup()
