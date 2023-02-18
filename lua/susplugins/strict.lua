return {
    -- 严格样式
    {
        "emileferreira/nvim-strict",
        event = "BufReadPost",
        config = function ()
            local strict = require("strict")
            local sopts = {noremap = true,silent = true}
            vim.keymap.set('n', '<Leader>flw', strict.remove_trailing_whitespace, sopts)
            vim.keymap.set('n', '<Leader>fle', strict.remove_trailing_empty_lines, sopts)
            vim.keymap.set('n', '<Leader>flt', strict.convert_spaces_to_tabs, sopts)
            vim.keymap.set('n', '<Leader>fls', strict.convert_tabs_to_spaces, sopts)
            vim.keymap.set('n', '<Leader>fll', strict.split_overlong_lines, sopts)
            strict.setup({
                exclude_filetypes = {"markdown","org","norg","tex","html"},
                exclude_buftypes = {"help","nofile","terminal","prompt"},
                deep_nesting = {
                    depth_limit = 5,
                    ignored_trailing_characters = ',',
                    ignored_leading_characters = '.',
                },
                trailing_whitespace = {
                    highlight = true,
                },
                overlong_lines = {
                    length_limit = 120,
                },
                space_indentation = {
                    highlight = false,
                },
                todos = {
                    highlight = false,
                }
            })
        end
    }
}
