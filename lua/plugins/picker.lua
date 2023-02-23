return {
    -- 图标选择器
    {
        "ziontee113/icon-picker.nvim",
        cmd = {"IconPickerNormal","IconPickerYank","IconPickerInsert"},
        opts = {
            disable_legacy_commands =true,
        }
    },
    -- 提示用户选择一个窗口，并返回所选取窗口的窗口ID
    {
        "s1n7ax/nvim-window-picker",
        version = "v1.*",
        event = "VeryLazy",
        opts = {
            autoselect_one = true,
            include_current_win = true,
            filter_rules = {
                bo = {
                    filetype = { "neo-tree", "neo-tree-popup", "notify","markdown" },
                    buftype = { "terminal", "quickfix" }
                }
            },
            other_win_hl_color = '#e35e4f',
        }
    }
}
