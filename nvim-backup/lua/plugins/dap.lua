return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"mfussenegger/nvim-dap-python",
	},
	keys = {
		{
			"<F5>",
			function()
				require("telescope").extensions.dap.configurations({})
			end,
		},
		{
			"<F17>",
			function()
				require("dap").terminate()
			end,
		}, -- Shift + F5
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<Leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<Leader>B",
			function()
				require("dap").set_breakpoint()
			end,
		},
		{
			"<Leader>lp",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
		},
		{
			"<Leader>dr",
			function()
				require("dap").repl.open()
			end,
		},
		{
			"<Leader>dl",
			function()
				require("dap").run_last()
			end,
		},
		{
			"<Leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			mode = { "n", "v" },
		},
		{
			"<Leader>dp",
			function()
				require("dap.ui.widgets").preview()
			end,
			mode = { "n", "v" },
		},
		{
			"<Leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
		},
		{
			"<Leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("nvim-dap-virtual-text").setup()
		require("dapui").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.disconnect["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- codelldb difinition & configuration
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "/home/olioolii/.tools/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp -- C <-> CPP
	end,
}
