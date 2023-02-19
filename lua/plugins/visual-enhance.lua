return {
    -- 高度实验性插件
    {
        "folke/noice.nvim",
        evnet = "VeryLazy",
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
    -- 带颜色的窗口分割线
    {
        "nvim-zh/colorful-winsep.nvim",
        evnet = "VeryLazy",
        opts = {
            highlight = {
                bg = "#774933",
                fg = "#1F3432",
            }
        }
    },
    -- 光标位置
    {
        "edluffy/specs.nvim",
        event = "VeryLazy",
        config=function ()
            require("specs").setup({
                show_jumps  = true,
                min_jump = 30,
                popup = {
                    delay_ms = 0,
                    inc_ms = 10,
                    blend = 10,
                    width = 10,
                    winhl = "PMenu",
                    fader = require('specs').linear_fader,
                    resizer = require('specs').shrink_resizer
                },
                ignore_filetypes = {},
                ignore_buftypes = {
                    nofile = true
                }
            })
        end
    },
    --光标行号模式指示器
    {
        "mawkler/modicator.nvim",
        evnet = "BufReadPost",
        init = function ()
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
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
        event = "BufReadPost",
		opts = {
			verbosity = 0,
			saving_path = "/home/colin/.cache/nvim/highstr/", -- 最好使用绝对路径
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
        evnet = "BufReadPost",
        opts = {}
    }
}
