return {
    -- cmake工具集成
    {
        "Civitasv/cmake-tools.nvim",
        event = "BufReadPre",
        opts = {
            cmake_command = "cmake",
            cmake_build_directory = "",
            cmake_build_directory_prefix = "cmake_build_",
            cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_show_console = "always",
            cmake_dap_configuration = { name = "cpp", type = "lldb-vscode", request = "launch" },
            cmake_variants_message = {
                short = { show = true },
                long = { show = true, max_length = 40 }
            }
        }
    },
    -- 工程管理
    {
        "ahmedkhalf/project.nvim",
        event = "VimEnter",
        config = function ()
            require("project_nvim").setup()
        end
    },
    -- 正则表达式解释器
    {
        "bennypowers/nvim-regexplainer",
        event = "BufReadPre",
        opts = {
            mappings = {
                toggle = "gR",
                show = "gS",
                hide = "gH",
                show_popup = "gU"
            },
            narrative = {
                separator = function(component)
                    local sep = '\n';
                    if component.depth > 0 then
                        for _ = 1, component.depth do
                            sep = sep .. '> '
                        end
                    end
                    return sep
                end
            }
        }
    }
}
