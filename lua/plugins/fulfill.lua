return {
    -- 自动保存
    {
        "Pocco81/auto-save.nvim",
        event = {"BufReadPre","BufNewFile"},
        opts = {}
    },
    -- 自动恢复光标位置
    {
        "ethanholz/nvim-lastplace",
        event = "BufReadPre",
        opts = {
            --这些 buffer 类型不记录光标位置
            lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
            -- 这些文件类型不记录光标位置
            lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
            -- 代码折叠部分
            lastplace_open_folds = true
        }
    },
    -- 自动匹配括号
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        -- 使用treesitter来检查
        config = function ()
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")

            npairs.setup({
                disable_filetype = {"TelescopePrompt","spectre_panel"},
                check_ts = true,
                ts_config = {
                    lua = {'string'},
                    javascript = {'template_string'},
                    java = false,
                },
                enable_check_bracket_line = false,
                -- ignored_next_char = "[%w%.]",
                fast_wrap = {
                    map = '<M-e>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    highlight = 'Search',
                    highlight_grey='Comment'
                }
            })
            local ts_conds = require('nvim-autopairs.ts-conds')
            npairs.add_rules({
                Rule("%", "%", "lua")
                    :with_pair(ts_conds.is_ts_node({'string','comment'})),
                Rule("$", "$", "lua")
                    :with_pair(ts_conds.is_not_ts_node({'function'}))
            })
        end
    }
}
