local settings = {}

settings["use_copilot"] = false

settings["format_notify"] = false

settings["disabled_plugins"] = {
	"edluffy/specs.nvim",
	"lewis6991/gitsigns.nvim",
	"dstein64/nvim-scrollview",
}

settings["lsp_deps"] = function()
	return {
		"bashls",
		"clangd",
		"jsonls",
		"lua_ls",
		"pylsp",
		"cmake",
	}
end

settings["null_ls_deps"] = function()
	return {
		"clang_format",
		"shfmt",
		"stylua",
		"prettier",
		"cmakelang",
	}
end

settings["dap_deps"] = function()
	return {
		"codelldb",
		"python",
	}
end

return settings
