return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},

				c = {
					require("formatter.filetypes.c").clangformat,
					function()
						return {
							exe = "clang-format",
							args = {
								"-assume-filename",
								util.escape_path(util.get_current_buffer_file_name()),
							},
							cwd = vim.fn.expand("%:p:h"),
							stdin = true,
							try_node_modules = true,
						}
					end,
				},

				cpp = {
					require("formatter.filetypes.cpp").clangformat,
					function()
						return {
							exe = "clang-format",
							args = {
								"-assume-filename",
								util.escape_path(util.get_current_buffer_file_name()),
							},
							cwd = vim.fn.expand("%:p:h"),
							stdin = true,
							try_node_modules = true,
						}
					end,
				},

				python = {
					require("formatter.filetypes.python").black,
				},

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
			formatter = {},
		})

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}
