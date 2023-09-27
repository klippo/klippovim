vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*/templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml",
	command = "lua vim.bo.filetype = 'helm'",
})

-- autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("SetHelmCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "# %s"
	end,
	pattern = { "terraform", "hcl" },
})
