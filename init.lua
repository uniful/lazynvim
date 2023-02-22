local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local settings = {
    concurrency = nil,
    dev = {
        path = "~/.local/share/nvim/local-plugin",
        patterns = {},
        fallback = false,
    },
    install = {
        missing = true,
        colorscheme = {"onenord"},
    },
    ui = {
        border = "rounded",
        icons = {
            lazy = "鈴 ",
        }
    },
    checker = {
        enabled = true,
        concurrency = 10,
        notify = true,
        frequency = 7200,
    },
    performance = {
        rtp = {
            -- 列出禁用的插件
            disabled_plugins = {}
        }
    }
}

require("core.keymaps")
require("core.options")
require("lazy").setup("plugins",settings)
