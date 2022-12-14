-- require('plugins.configs.telescope').setup()
-- require('plugins.configs.nvimtree').setup()
-- require('project_nvim').setup()
local plugin_configs = {
	"alpha",
	"bufferline",
	"colorizer",
	"gitsigns",
	"hydra",
	"lspconfig",
	"null_ls",
	"noice",
	"nvimtree",
	"telescope",
	"treesitter",
	"zen-mode",
}
for _, pc in pairs(plugin_configs) do
	require("plugins.configs." .. pc)
end
-- require("noice").setup()
require("Comment").setup()
require("marks").setup()
-- require('dressing').setup()
require("git-conflict").setup()
require("nvim-autopairs").setup({})
require("nvim-autopairs").setup({})
require("remember")
require("trouble").setup()
require("nvim-surround").setup()
require("go").setup()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("go").setup({
	lsp_cfg = {
		capabilities = capabilities,
	},
})
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
