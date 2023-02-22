-- 文件查找
return {
   -- telescope模糊查找
   {
        "nvim-telescope/telescope.nvim",
        branch='0.1.x',
        event = "VeryLazy",
        dependencies = {
            --运行dap界面的命令产生telescope提示
            {"nvim-telescope/telescope-dap.nvim",lazy = true},
            --neovim核心内容可以填充到telescope
            {"nvim-telescope/telescope-ui-select.nvim",lazy = true},
            --支持的文件和文件夹的同步创建、删除、重命名和移动
            {"nvim-telescope/telescope-file-browser.nvim",lazy = true},
            --记忆特定上下文的提示输入的历史实现
            {"nvim-telescope/telescope-smart-history.nvim",lazy = true},
            --在编辑历史中选择文件时提供智能优先级排序(以频率和新近度排序)
            {"nvim-telescope/telescope-frecency.nvim",lazy = true},
            --实时 grep args 选择器。
            {"nvim-telescope/telescope-live-grep-args.nvim",lazy = true},
            --可视化您的撤消树和其中的模糊搜索更改
            {"debugloop/telescope-undo.nvim",lazy = true},
        },
        config = function()
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")
            local telescope = require("telescope")
            local lga_actions = require("telescope-live-grep-args.actions")
            require('telescope').setup{
                defaults = {
                    history = {
                        path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
                        limit = 100,
                    },
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                        n = {["<c-t>"] = trouble.open_with_trouble },
                    }
                },
                pickers = {},
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        mappings = {
                            ["i"] = {},
                            ["n"] = {},
                        },
                    },
                    live_grep_args = {
                        auto_quoting = true,
                        mappings = {
                            i = {
                                ["<C-k>"] = lga_actions.quote_prompt(),
                            }
                        }
                    },
                    undo = {
                        side_by_size = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.8,
                        }
                    },
                    frecency = {
                        db_root = "~/.local/share/nvim",
                        show_scores = false,
                        show_unindexed = true,
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("notify")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("dap")
            require("telescope").load_extension("frecency")
            require('telescope').load_extension("projects")
            require('telescope').load_extension("smart_history")
            require("telescope").load_extension("live_grep_args")
            require("telescope").load_extension("noice")
            require("telescope").load_extension("undo")
            require("telescope").load_extension("harpoon")
            require("telescope").load_extension("yank_history")
            require("telescope").load_extension("aerial")
        end
    },
    -- fzf模糊查找
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        opts = {
            winopts = {
                hl = {
                    border = "FloatBorder",
                }
            }
        }
    },
    -- 文件标记
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        opts = {
            save_on_toggle = true
        }
    }
}
