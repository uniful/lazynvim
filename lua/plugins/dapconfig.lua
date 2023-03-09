-- dap协议调试插件
return {
     -- 代码调试
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        cmd = {"DapContinue","DapToggleBreakpoint","DapTerminate","DapToggleRepl","DapShowLog","DapStepInto",
        "DapStepOver","DapStepOut","DapSetLogLevel","DapRestartFrame","DapLoadLaunchJSON"},
        keys = {
            {"<leader>du","<cmd>lua require('dapui').toggle()<CR>",desc="Dapui Toggle"},
            vim.keymap.set("n","<leader>dr",function()
                require("dap").run_last()
            end,{desc="Restart Debug"}),
            vim.keymap.set("n","<leader>do",function()
                require("dap").repl.open()
            end,{desc="Open Repl"}),
            vim.keymap.set("n","<leader>dm", function()
                require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) 
            end,{desc="Log Point Message"})
        },
        dependencies = {
            -- 提供UI界面
            {
                "rcarriga/nvim-dap-ui",
                lazy = true
            },
            -- 提供内联文本
            {
                "theHamsta/nvim-dap-virtual-text",
                lazy = true,
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
            {
                "telescope.nvim"
            }
        },
        config = function ()
            require("debugger.dapsettings")
            require("debugger.dapuisettings")
            require("debugger.dapstartup")
        end
    },
    ------ 特定语言调试需要用到的插件 ------
    -- lua
    {
        "jbyuki/one-small-step-for-vimkind",
        lazy = true,
        keys = {
            {"<leader>dlr","<cmd>lua require('osv').run_this()<CR>",desc="Lua Debug Run"},
            {"<leader>dlt","<cmd>lua require('osv').start_trace()<CR>",desc="Lua Debug Start Trace"},
            {"<leader>dls","<cmd>lua =require('osv').stop_trace()<CR>",desc="Lua Debug Stop Trace"}
        },
        dependencies = "nvim-dap"
    }
}
