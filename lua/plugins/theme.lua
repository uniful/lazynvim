return {
    -- 主题
    {
        "glepnir/zephyr-nvim",
        priority = 1000,
        config = function ()
            vim.cmd[[colorscheme zephyr]]
        end
    }
}
