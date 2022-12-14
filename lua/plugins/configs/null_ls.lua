local present, null_ls = pcall(require, "null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.diagnostics.tidy,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.shellharden,
	},
})
