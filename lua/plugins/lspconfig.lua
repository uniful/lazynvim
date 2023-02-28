return {
    -- LSP 基础服务
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre","BufNewFile"},
        dependencies = {
            {
                -- Neovim中lua API完整签名、帮助和补全
                "folke/neodev.nvim",lazy = true,
                opts = {}
            }
        },
        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {"clangd","pyright","lua_ls","cmake","vimls","bashls","marksman",
                "yamlls","taplo","tsserver","jsonls","html","cssls","diagnosticls","lemminx","jdtls"}

            -- 代码折叠(nvim-ufo)
            capabilities.textDocument.foldingRange = {dynamicRegistration = false,lineFoldingOnly = true}

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
                elseif rawequal(lsp,"diagnosticls") then
                    lspconfig[lsp].setup({
                        filetypes = {"fish","zsh","org","norg"},
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
        dependencies = {
            {
                -- 管理和安装null-ls的diagnostics和formatting服务
                "jay-babu/mason-null-ls.nvim", lazy = true,
                cmd = {"NullInstall","NullUninstall"},
                opts = {
                    ensure_installed = {},
                    automatic_installation = {
                        exclude = {
                            -- diagnostics
                            "pylint","cmakelang","luacheck","shellcheck","tidy","markdownlint","yamllint",
                            "cspell","eslint",
                            -- formatting
                            "shellharden","yapf","jq","taplo","stylua","gersemi","codespell",
                            ----- common -----
                            -- eslint,markdownlint,tidy
                        }
                    },
                    automatic_setup = false
                }
            }
        },
        opts = {
            ui = {
                border = "rounded",
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
            ensure_installed = {"jdtls","marksman","lemminx"},
            automatic_installation = {
                exclude = {"lua_ls","cmake","pyright","clangd","bashls","vimls",
                    "jsonls","cssls","tsserver","ymalls","taplo","diagnosticls","html"}
            }
        }
    }
}
