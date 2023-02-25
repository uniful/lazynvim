return {
    -- LSP 基础服务
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre","BufNewFile"},
        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {"clangd","pyright","lua_ls","cmake","vimls","bashls","zk",
                "yamlls","taplo","tsserver","jsonls","html","cssls"}

            for _, lsp in pairs(servers) do
                if rawequal(lsp,"lua_ls") then
                    lspconfig[lsp].setup({
                        settings = {
                            lua = {
                                runtime = {
                                    version = 'luaJIT',
                                },
                                diagnostics = {
                                    globals = { 'vim' }
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                                telemetry = {
                                    enable = false
                                },
                                completion = {
                                    callSnippet = "Replace"
                                }
                            }
                        },
                        capabilities = capabilities
                    })
                elseif rawequal(lsp,"jsonls") then
                    lspconfig[lsp].setup({
                        settings = {
                            json = {
                                schemas = require("schemastore").json.schemas(),
                                vaildate = {enable = true},
                            }
                        },
                        capabilities = capabilities
                    })
                else
                    lspconfig[lsp].setup({
                        capabilities = capabilities
                    })
                end
            end
        end
    },
    -- 管理lsp,dap,lint服务的安装和配置
    {
        "williamboman/mason.nvim",
        cmd = {"Mason","MasonInstall","MasonUninstall","MasonUninstallAll","MasonLog"},
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
    -- 管理安装lsp服务器
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = {"LspInstall","LspUninstall"},
        opts = {
            ensure_installed = {},
            automatic_installation = {
                exclude = {"lua_ls","cmake","pyright","clangd","bashls","vimls",
                    "jsonls","cssls","tsserver","ymalls","zk","taplo"}
            }
        }
    },
    -- 管理安装code_action,diagnostics,formatting服务
    {
        "jay-babu/mason-null-ls.nvim",
        lazy = true,
        opts = {
            ensure_installed = {},
            automatic_installation = {
                exclude = {"cspell","gitsigns","eslint",
                    "pylint","cmakelint","luacheck","vint",
                    "shellcheck","tidy","markdownlint","yamllint",
                    "shellharden","yapf","jq","taplo","stylua","cmake_format","codespell"}
            },
            automatic_setup = false
        }
    }
}
