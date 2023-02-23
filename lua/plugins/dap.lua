-- dap协议调试插件
return {
     -- 代码调试
    {
        "mfussenegger/nvim-dap",
        cmd = {"DapContinue","DapToggleBreakpoint","DapTerminate","DapToggleRepl","DapVirtualTextToggle",
        "DapVirtualTextEnable","DapVirtualTextDisable","DapVirtualTextForceRefresh","DapShowLog","DapStepInto",
        "DapStepOver","DapStepOut","DapSetLogLevel","DapRestartFrame","DapLoadLaunchJSON"},
        dependencies = {
            {"rcarriga/nvim-dap-ui",lazy = true}, -- 提供UI界面
            {
                "theHamsta/nvim-dap-virtual-text",lazy = true, -- 提供内联文本
                opts = {
                    enabled = true,
                    enabled_commands = true,
                    highlight_changed_variables = true,
                    highlight_new_as_changed = true,
                    show_stop_reason = true,
                    commented = true,
                    only_first_definition = true,
                    all_references = true,
                    display_callback = function (variable, _buf, _stackframe, _node)
                        return variable.name .. '=' .. variable.value
                    end,
                    virt_text_pos = 'eol',
                    all_frames = true,
                    virt_lines = false,
                    virt_text_win_col = nil
                }
            },
            -- 特定需要插件的语言
            {
                "jbyuki/one-small-step-for-vimkind",
                lazy = true,
                ft = {"lua","luau"}
            }
        },
        config = function ()
            require("debugger.config")
            require("debugger.startup")
        end
    }
}
