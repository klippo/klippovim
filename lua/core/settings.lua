local set = vim.opt -- set options
set.termguicolors = true
set.autoindent = true
set.copyindent = true -- copy indent from the previous line
set.smartindent = true
set.expandtab = true -- tabs are space
set.shiftwidth = 2 -- number of spaces to use for autoindent
set.softtabstop = 2 -- number of spaces in tab when editing
set.tabstop = 2 -- number of visual spaces per TAB

set.cmdheight = 0

--set.clipboard += unnamedplus
set.clipboard = "unnamed,unnamedplus"
set.cursorline = true
set.hidden = true
set.laststatus = 2

set.number = true
set.showcmd = true
set.showmatch = true
set.wildmenu = true
set.list = true
set.listchars = "tab:>-,trail:~,extends:>,precedes:<"

set.hlsearch = true --        " highlight matche
set.ignorecase = true --      " ignore case when searching
set.incsearch = true --      " search as characters are entered
set.smartcase = true --       " ignore case if search pattern is lower case

-- folding
-- Additional folding configuration in plugins/configs/treesitter.lua
set.foldenable = true
set.foldlevelstart = 10 -- " default folding level when buffer is opened
set.foldnestmax = 10 -- " maximum nested fold
-- set.foldmethod = "syntax" -- " fold based on indentation

set.completeopt = "menu,menuone,noselect"

set.splitright = true

set.backup = true
set.backupdir = vim.fn.stdpath("data") .. "/backup"
set.undofile = true

-- set.scrolloff = 999

vim.g.mapleader = ","
vim.g.dashboard_default_executive = "telescope"

vim.o.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
vim.o.grepformat = "%f:%l:%c:%m"

local group = vim.api.nvim_create_augroup("Local", {})

-- vim.api.nvim_create_autocmd({
--   "BufRead", "BufNewFile"}, {
--   pattern = {"*.sls"},
--   command = "lua vim.bo.filetype = 'yaml.jinja2'",
--   group = group,
-- })

-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = {"*/saltstack/*.{yml,yaml}"},
--   command = "lua vim.diagnostic.disable()",
--   group = group,
-- })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*/saltstack/*.{yml,yaml}" },
	command = "lua vim.bo.filetype = 'yaml.jinja2'",
	group = group,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.{tf,tfvars}",
	command = "lua vim.bo.filetype = 'terraform'",
	group = group,
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = "*",
	command = "if &diff | setlocal wrap< | endif",
	group = group,
})
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "# %s"
	end,
	pattern = { "terraform", "hcl" },
})
