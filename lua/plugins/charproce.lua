-- 字符处理: 跳转、修改、转换、搜索
return {
    -- 快速跳转
    {
        "phaazon/hop.nvim",
        cmd = {"HopAnyWhere","HopChar1","HopChar2","HopLine","HopLineStart","HopVertical","HopPattern","HopWord"},
        branch = 'v2',
        opts = {
            keys = "etovxqpdygfblzhckisuran"
        }
    },
    -- 文本内字符移动、跳转
    {
        "ggandor/leap.nvim",
        event = {"BufReadPost","BufNewFile"},
        dependencies = {
            {
                "ggandor/flit.nvim", --跳转增强
                lazy = true,
                opts = {
                    labeled_modes = "nv",
                    multiline = true,
                }
            }
        },
        config = function ()
            require("leap").add_default_mappings(true)
        end
    },
    -- 文本字符替换
    {
        "nvim-pack/nvim-spectre",
        event = {"BufReadPost","BufNewFile"},
        opts = {}
    },
    -- 添加/更改/删除周围的定界符对
    {
        "kylechui/nvim-surround",
        version = "*",
        event = {"BufReadPost","BufNewFile"},
        opts = {}
    },
    -- 结构搜索和替换
    {
        "cshuaimin/ssr.nvim",
        keys = {
            vim.keymap.set({"n","x"},"<leader>sr",function ()
                require("ssr").open()
            end,{desc = "Structural Replace"})
        },
        opts = {
            border = "rounded",
            min_width = 50,
            min_height = 5,
            max_width = 120,
            max_height = 25,
            keymaps = {
                close = "q",
                next_match = "n",
                prev_match = "N",
                replace_confirm = "<cr>",
                replace_all = "<leader><leader><cr>",
            },
        }
    },
    -- 搜索时显示条目
    {
        "kevinhwang91/nvim-hlslens",
        event = "VeryLazy",
        config = function ()
            local opts = {
                calm_down = true,
                nearest_only = true,
                nearest_float_when = "always",
                -- 自定义虚拟文本
                override_lens = function(render, posList, nearest, idx, relIdx)
                    local sfw = vim.v.searchforward == 1
                    local indicator, text, chunks
                    local absRelIdx = math.abs(relIdx)
                    if absRelIdx > 1 then
                        indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
                    elseif absRelIdx == 1 then
                        indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
                    else
                        indicator = ''
                    end

                    local lnum, col = unpack(posList[idx])
                    if nearest then
                        local cnt = #posList
                        if indicator ~= '' then
                            text = ('[%s %d/%d]'):format(indicator, idx, cnt)
                        else
                            text = ('[%d/%d]'):format(idx, cnt)
                        end
                        chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
                    else
                        text = ('[%s %d]'):format(indicator, idx)
                        chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
                    end
                    render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
                end
            }
            require("scrollbar.handlers.search").setup(opts)
        end
    },
    -- 字符、颜色、数字增量/减量
    {
        "monaqa/dial.nvim",
        evnet = {"BufReadPost","BufNewFile"},
        config = function()
            local augend = require("dial.augend")
            local nopts = {noremap = true}
            require("dial.config").augends:register_group{
                -- 字符循环跳转
                chars_dial = {
                    augend.constant.new{elements={"+","-"},word=false,cyclic=true},
                    augend.constant.new{elements={"x","/"},word=false,cyclic=true},
                    augend.constant.new{elements={">","<"},word=false,cyclic=true},
                    augend.constant.new{elements={"=","!="},word=false,cyclic=true},
                    augend.constant.new{elements={"|","&"},word=false,cyclic=true},
                    augend.constant.new{elements={"||","&&"},word=false,cyclic=true},
                    augend.constant.new{elements={"true","false"},word=true,cyclic=true},
                    augend.constant.new{elements={"and","or"},word=true,cyclic=true},
                    augend.constant.new{elements={"if","else"},word=true,cyclic=true},
                    augend.constant.new{elements={"yes","no"},word=true,cyclic=true},
                    augend.constant.new{elements={"on","off"},word=true,cyclic=true},
                    augend.constant.new{elements={"left","right"},word=true,cyclic=true,},
                    augend.constant.new{elements={"out","in"},word=true,cyclic=true},
                    augend.constant.new{elements={"up","down"},word=true,cyclic=true},
                    augend.constant.new{elements={"disable","enable"},word=true,cyclic=true},
                    augend.constant.new{elements={"output","input"},word=true,cyclic=true},
                    augend.constant.new{elements={"front","rear"},word=true,cyclic=true},
                    augend.constant.new{elements={"start","end"},word=true,cyclic=true},
                    augend.constant.new{elements={"0","1","2","3","4","5","6","7","8","9"},word=false,cyclic=true},
                },
                -- 颜色增加或减少
                color_dial = {
                    augend.hexcolor.new{
                        case = "lower",
                    }
                },
                -- 日期增加/减少
                date_dial = {
                    augend.date.new{
                        pattern = "%Y/%m/%d",
                        default_kind = "day",
                        only_valid = true,
                        word = false,
                    }
                },
            }
            vim.keymap.set("n", "<M-c>", require("dial.map").inc_normal("chars_dial"), nopts)
            vim.keymap.set("n", "<M-d>", require("dial.map").dec_normal("chars_dial"), nopts)
            vim.keymap.set("n", "<M-f>", require("dial.map").inc_normal("color_dial"), nopts)
            vim.keymap.set("n", "<M-g>", require("dial.map").dec_normal("color_dial"), nopts)
            vim.keymap.set("n", "<M-z>", require("dial.map").inc_normal("date_dial"), nopts)
            vim.keymap.set("n", "<M-x>", require("dial.map").dec_normal("date_dial"), nopts)
        end
    }
}
