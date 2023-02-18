return {
    -- 显示光标下相同词汇
    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
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
