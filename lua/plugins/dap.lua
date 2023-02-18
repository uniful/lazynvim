-- dap协议调试插件
return {
     -- 代码调试基础插件
    {
        "mfussenegger/nvim-dap",
        evnet = "BufReadPost",
        config = function ()
            require("debugger.dap-config").setup()
        end
    },
     -- 为代码调试提供 UI 界面
    {
        "rcarriga/nvim-dap-ui",
        lazy = true
    },
    -- 为代码调试提供内联文本
    {
        "theHamsta/nvim-dap-virtual-text",
        event = "BufReadPost",
        opts = {
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = true,
            only_first_definition = true,
            all_references = false,
            filter_references_pattern = '<module',
            virt_text_pos = 'eol',
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil,
        }
    },

    ----- 特定需要插件的语言 -----
    -- lua
    {
        "jbyuki/one-small-step-for-vimkind",
        ft = "lua"
    }
}
