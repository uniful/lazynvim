-- 文件查找
return {
   -- telescope模糊查找
   {
        "nvim-telescope/telescope.nvim",
        branch='0.1.x',
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            --neovim核心内容可以填充到telescope
            {"nvim-telescope/telescope-ui-select.nvim",lazy = true},
            --支持的文件和文件夹的同步创建、删除、重命名和移动
            {"nvim-telescope/telescope-file-browser.nvim",lazy = true},
            --在编辑历史中选择文件时提供智能优先级排序(以频率和新近度排序)
            {"nvim-telescope/telescope-frecency.nvim",lazy = true},
        },
        config = function()
            local trouble = require("trouble.providers.telescope")
            require('telescope').setup{
                defaults = {
                    mappings = {
                        i = {
                            ["<c-h>"] = "which_key",
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                        n = {
                            ["<c-t>"] = trouble.open_with_trouble
                        },
                    }
                },
                pickers = {
                    find_files = {
                        theme = "ivy"
                    }
                },
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        mappings = {
                            ["i"] = {},
                            ["n"] = {},
                        },
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- cmake-tools插件需要用到
                            width = 0.8,
                            previewer = false,
                            prompt_title = false,
                            borderchars = {
                                { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                                prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                                results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                                preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                            }
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("notify")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("frecency")
            require('telescope').load_extension("projects")
            require("telescope").load_extension("noice")
            require("telescope").load_extension("harpoon")
            require("telescope").load_extension("yank_history")
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
        keys = {
            {"<leader>hpa","<cmd>lua require('harpoon.mark').add_file()<CR>",desc="Mark Files"},
            {"<leader>hpq","<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",desc="View All File Mark"},
            {"<leader>hpp","<cmd>lua require('harpoon.ui').nav_prev()<CR>",desc="Prev Mark Files"},
            {"<leader>hpn","<cmd>lua require('harpoon.ui').nav_next()<CR>",desc="Next Mark Files"},
            {"<leader>hpt","<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>",desc="Navigate to 1 Terminal"}
        },
        opts = {
            save_on_toggle = true
        }
    },
    -- 文件字符标记
    {
        "LeonHeidelbach/trailblazer.nvim",
        cmd = {"TrailBlazerNewTrailMark","TrailBlazerTrackBack","TrailBlazerPeekMovePreviousUp",
        "TrailBlazerPeekMoveNextDown","TrailBlazerMoveToNearest","TrailBlazerDeleteAllTrailMarks",
        "TrailBlazerPasteAtLastTrailMark","TrailBlazerPasteAtAllTrailMarks","TrailBlazerNewTrailMark",
        "TrailBlazerToggleTrailMarkList","TrailBlazerOpenTrailMarkList","TrailBlazerCloseTrailMarkList",
        "TrailBlazerSwitchTrailMarkStack","TrailBlazerAddTrailMarkStack","TrailBlazerDeleteTrailMarkStacks",
        "TrailBlazerDeleteAllTrailMarkStacks","TrailBlazerSwitchNextTrailMarkStack","TrailBlazerSwitchPreviousTrailMarkStack",
        "TrailBlazerSetTrailMarkStackSortMode","TrailBlazerSaveSession","TrailBlazerLoadSession"},
        opts = {}
    }
}
