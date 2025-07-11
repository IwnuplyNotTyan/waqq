return {
	{'leoluz/nvim-dap-go'},
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", 
						 "nvim-neotest/nvim-nio", 
						 "leoluz/nvim-dap-go",
					 },
	config = function()
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

require('dap-go').setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
	end},
}
