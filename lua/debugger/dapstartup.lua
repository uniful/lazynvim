local dap, dapui = require "dap", require "dapui"

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.disconnect["dapui_config"] = function()
    dapui.close()
end

require("debugger.lang.dap-cpp")
require("debugger.lang.dap-lua")
require("dap.ext.vscode").load_launchjs(nil,{lldb = {"c","cpp"}})
