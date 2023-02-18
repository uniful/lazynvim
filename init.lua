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

vim.go.maplocalleader = ","
local settings = {
    root = vim.fn.stdpath("data") .. "/lazy",
    defaults = {lazy = false,version = nil,},
    spec = nil,
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    concurrency = nil,
    git = {
        log = { "--since=3 days ago" },
        timeout = 120,
        url_format = "https://ghproxy.com/https://github.com/%s.git",
        filter = true,
    },
    dev = {
        path = "~/.local/nvim/local-plugin",
        patterns = {},
        fallback = false,
    },
    install = {
        missing = true,
        colorscheme = { "zephyr" },
    },
    ui = {
        size = {width = 0.8,height = 0.8},
        wrap = true,
        border = "none",
        icons = {
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "鈴 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔ ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
        browser = nil,
        throttle = 20,
        custom_keys = {
            ["<localleader>l"] = function(plugin)
                require("lazy.util").float_term({ "lazygit", "log" }, {
                    cwd = plugin.dir,
                })
            end,
            ["<localleader>t"] = function(plugin)
                require("lazy.util").float_term(nil, {
                    cwd = plugin.dir,
                })
            end,
        },
    },
    diff = {cmd = "git"},
    checker = {
        enabled = true,
        concurrency = 10,
        notify = true,
        frequency = 3600,
    },
    change_detection = {
        enabled = true,
        notify = true,
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath("cache") .. "/lazy/cache",
            disable_events = { "UIEnter", "BufReadPre" },
            ttl = 3600 * 24 * 5,
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            -- 列出禁用的插件
            disabled_plugins = {},
        },
    },
    readme = {
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        skip_if_doc_exists = true,
    },
    state = vim.fn.stdpath("state") .. "/lazy/state.json",
}

require("core.keymaps")
require("core.options")
require("lazy").setup("plugins",settings)
