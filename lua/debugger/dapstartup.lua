require("debugger.lang.dap-cpp")
require("debugger.lang.dap-bash")
require("debugger.lang.dap-lua")
require("dap.ext.vscode").load_launchjs(nil,{lldb = {"c","cpp"}})
