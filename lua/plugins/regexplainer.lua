return {
    -- 正则表达式解释器
    {
        "bennypowers/nvim-regexplainer",
        event = "BufReadPost",
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
