return {
    -- Neovim启动封面
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function ()
            require("alpha").setup(require'alpha.themes.dashboardt'.config)
        end
    }
}
