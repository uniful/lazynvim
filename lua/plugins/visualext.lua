return {
    -- 高度实验性插件
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function ()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    }
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    lsp_doc_border = true,
                },
                views = {
                    split = {
                        enter = true
                    }
                }
            })
        end
    },
    -- 精美弹窗
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            stages = "fade",
            -- 消息框持续时间,默认5000(毫秒)
            timeout = 10000
        }
    },
    --光标行号模式指示器
    {
        "mawkler/modicator.nvim",
        lazy = true,
        init = function ()
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
        event = {"BufReadPost","BufNewFile"},
        opts = {
            highlishts = {
                defaults = {
                    bold = true
                },
            }
        }
    },
	-- 突出显示文本
	{
		"Pocco81/HighStr.nvim",
        lazy = true,
        cmd = {"HSHighlight","HSRmHighlight","HSImport"},
		opts = {
			verbosity = 0,
			saving_path = "/home/colin/.cache/nvim/highstr/", -- 使用绝对路径
			highlight_colors = {
				color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
				color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
				color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
				color_3 = {"#8A2BE2", "smart"},	-- Proton purple
				color_4 = {"#FF4500", "smart"},	-- Orange red
				color_5 = {"#008000", "smart"},	-- Office green
				color_6 = {"#0000FF", "smart"},	-- Just blue
				color_7 = {"#FFC0CB", "smart"},	-- Blush pink
				color_8 = {"#FFF9E3", "smart"},	-- Cosmic latte
				color_9 = {"#7d5c34", "smart"},	-- Fallow brown
			}
		}
	},
    -- 显示十六进制颜色
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            filetypes = {
                '*';
                cmp_docs = {always_update = true}
            },
            user_default_options = {
                RRGGBBAA = true,
                AARRGGBB = true,
                tailwind = true
            }
        }
    },
    -- 显示缩进线
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = {"BufReadPost","BufNewFile"},
        opts = {
            -- 显示当前所在区域
            show_current_context = true,
            -- 显示当前所在区域的开始位置
            show_current_context_start = true,
            -- 显示行尾符
            show_end_of_line = true,
            -- 空格字符缩进样式
            space_char_blankline = " ",
        }
    },
    -- 显示滚动条
    {
        "petertriho/nvim-scrollbar",
        event = "VeryLazy",
        config = function()
            local colors = {
                Handle = "#492E42",
                Search = "#F08671",
                Error  = "#FD6883",
                Warn   = "#FFD886",
                Info   = "#A9DC76",
                Hint   = "#78DCE8",
                Misc   = "#AB9DF2"
            }
            require("scrollbar").setup({
                handle = {
                    -- 滚动条颜色
                    color  = colors.Handle
                },
                marks = {
                    -- 诊断颜色
                    Search = {color = colors.Search},
                    Error  = {color = colors.Error},
                    Warn   = {color = colors.Warn},
                    Info   = {color = colors.Info},
                    Hint   = {color = colors.Hint},
                    Misc   = {color = colors.Misc}
                },
                handlers = {
                    gitsigns = true,
                    search = true
                }
            })
        end
    },
    -- 显示光标下相同词汇
    {
        "RRethy/vim-illuminate",
        lazy = true,
        event = {"BufReadPost","BufNewFile"},
        config = function ()
            local opts = {
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 200,
                filetype_overrides = {},
                filetypes_denylist = {
                    'dirvish',
                    'fugitive',
                },
                filetypes_allowlist = {},
                modes_denylist = {},
                modes_allowlist = {},
                providers_regex_syntax_denylist = {},
                providers_regex_syntax_allowlist = {},
                under_cursor = true,
                large_file_cutoff = nil,
                large_file_overrides = nil,
                min_count_to_highlight = 1,
            }
            require("illuminate").configure(opts)
        end
    }
}
