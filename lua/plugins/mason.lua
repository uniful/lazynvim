return {
    -- 管理lsp,dap,lint服务的安装和配置
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    -- 管理安装lsp
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {},
            automatic_installation = {exclude = {"lua_ls","cmake","pyright","clangd","bashls","vimls",
            "jsonls","cssls","tsserver","ymalls","zk","taplo"}}
        }
    },
    -- 管理安装null-ls
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = {},
            automatic_installation = {exclude = {"cspell","proselint","gitsigns","eslint","markdownlint",
            "pylint","cmakelint","cmake_format","luacheck","vint","codespell","shellcheck","tidy",
            "yamllint","shellharden","yapf","jq","taplo","stylua"}},
            automatic_setup = false
        }
    }
}
