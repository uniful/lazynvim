return {
    -- LSP 进度提示
    {
        "j-hui/fidget.nvim",
        event = {"BufReadPost","BufNewFile"},
        opts = {
            window = {
                blend = 0
            }
        }
    },
    -- 为不支持LSP高亮的主题提供默认高亮方案
    {
        "folke/lsp-colors.nvim",
        event = "BufReadPost",
        -- 主题不支持LSP高亮时,采用以下方案
        opts = {
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981",
        }
    },
    -- 灯泡提示代码行为
    {
        "kosayoda/nvim-lightbulb",
        event = {"BufReadPost","BufNewFile"},
        opts = {
            autocmd = {enabled = true}
        }
    },
    -- 显示元信息和差异预览的代码操作的弹出菜单
    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu"
    },
    -- LSP高性能UI插件
    {
        "glepnir/lspsaga.nvim",
        cmd = "Lspsaga",
        opts = {}
    },
    -- 使用lsp生成的视图符号
    {
        "simrat39/symbols-outline.nvim",
        cmd = {"SymbolsOutline","SymbolsOutlineOpen","SymbolsOutlineClose"},
        config = function ()
            local opts = {
                highlight_hovered_item = true,
                show_guides = true,
                auto_preview = false,
                position = 'right',
                relative_width = true,
                width = 25,
                auto_close = false,
                show_numbers = false,
                show_relative_numbers = false,
                show_symbol_details = true,
                preview_bg_highlight = 'Pmenu',
                autofold_depth = nil,
                auto_unfold_hover = true,
                fold_markers = { '', '' },
                wrap = false,
                keymaps = {
                    close = {"<Esc>", "q"},
                    goto_location = "<Cr>",
                    focus_location = "o",
                    hover_symbol = "<M-H>",
                    toggle_preview = "K",
                    rename_symbol = "r",
                    code_actions = "a",
                    fold = "h",
                    unfold = "l",
                    fold_all = "W",
                    unfold_all = "E",
                    fold_reset = "R",
                },
                lsp_blacklist = {},
                symbol_blacklist = {},
                symbols = {
                    File = { icon = "", hl = "@text.uri" },
                    Module = { icon = "", hl = "@namespace" },
                    Namespace = { icon = "", hl = "@namespace" },
                    Package = { icon = "", hl = "@namespace" },
                    Class = { icon = "𝓒", hl = "@type" },
                    Method = { icon = "ƒ", hl = "@method" },
                    Property = { icon = "", hl = "@method" },
                    Field = { icon = "", hl = "@field" },
                    Constructor = { icon = "", hl = "@constructor" },
                    Enum = { icon = "ℰ", hl = "@type" },
                    Interface = { icon = "ﰮ", hl = "@type" },
                    Function = { icon = "", hl = "@function" },
                    Variable = { icon = "", hl = "@constant" },
                    Constant = { icon = "", hl = "@constant" },
                    String = { icon = "𝓐", hl = "@string" },
                    Number = { icon = "#", hl = "@number" },
                    Boolean = { icon = "⊨", hl = "@boolean" },
                    Array = { icon = "", hl = "@constant" },
                    Object = { icon = "⦿", hl = "@type" },
                    Key = { icon = "🔐", hl = "@type" },
                    Null = { icon = "NULL", hl = "@type" },
                    EnumMember = { icon = "", hl = "@field" },
                    Struct = { icon = "𝓢", hl = "@type" },
                    Event = { icon = "🗲", hl = "@type" },
                    Operator = { icon = "+", hl = "@operator" },
                    TypeParameter = { icon = "𝙏", hl = "@parameter" },
                    Component = { icon = "", hl = "@function" },
                    Fragment = { icon = "", hl = "@constant" },
                }
            }
            require("symbols-outline").setup(opts)
        end
    },
    -- 使用lsp生成文件大纲
    {
        "stevearc/aerial.nvim",
        cmd = {"AerialToggle","AerialOpen","AerialOpenAll","AerialClose","AerialCloseAll",
        "AerialNext","AerialPrev","AerialGo","AerialInfo"},
        opts = {
            layout = {
                min_width = 20,
                default_direction = "prefer_left",
            },
            show_guides = true
        }
    },
    --显示代码诊断, 参考, telescope结果, quickfix和位置列表
    {
        "folke/trouble.nvim",
        cmd = {"TroubleToggle","Trouble"},
        opts = {
            position = "bottom",
            height = 10,
            width = 50,
            mode = "workspace_diagnostics",
            action_keys = {
                close = "q",
                cancel = "<esc>",
                refresh = "r",
                jump = {"<cr>", "<tab>"},
                open_split = { "<c-x>" },
                open_vsplit = { "<c-l>" },
                open_tab = { "<c-t>" },
                jump_close = {"o"},
                toggle_mode = "m",
                toggle_preview = "P",
                hover = "K",
                preview = "p",
                close_folds = {"zM", "zm"},
                open_folds = {"zR", "zr"},
                toggle_fold = {"zA", "za"},
                previous = "k",
                next = "j"
            },
            signs = {
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "﫠"
            },
            use_diagnostic_signs = true
        }
    }
}
