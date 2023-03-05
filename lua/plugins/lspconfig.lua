return {
    -- LSP 基础服务
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre","BufNewFile"},
        dependencies = {
            -- Neovim中lua API完整签名、帮助和补全
            {
                "folke/neodev.nvim",
                lazy = true,
                opts = {
                    experimental = {
                        pathStrict = true
                    }
                }
            },
            -- 连接mason.nvim和lspconfig的桥梁
            {
                "williamboman/mason-lspconfig.nvim",
                lazy = true,
                cmd = {"LspInstall","LspUninstall"},
                dependencies = "mason.nvim",
                opts = {
                    ensure_installed = {"jdtls","marksman","lemminx","taplo"},
                    automatic_installation = false
                }
            }
        },
        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {"clangd","pyright","lua_ls","cmake","vimls","bashls","marksman",
                "yamlls","taplo","tsserver","jsonls","html","cssls","lemminx","jdtls"}

            -- 代码折叠(nvim-ufo)
            capabilities.textDocument.foldingRange = {dynamicRegistration = false,lineFoldingOnly = true}

            for _, lsp in pairs(servers) do
                if rawequal(lsp,"lua_ls") then
                    lspconfig[lsp].setup({
                        settings = {
                            lua = {
                                runtime = {
                                    version = 'luaJIT'
                                },
                                diagnostics = {
                                    globals = {'vim'}
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true)
                                },
                                telemetry = {
                                    enable = false
                                },
                                completion = {
                                    callSnippet = "Both"
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
                                vaildate = {
                                    enable = true
                                }
                            }
                        },
                        capabilities = capabilities
                    })
                elseif rawequal(lsp,"jdtls") then
                        lspconfig[lsp].setup({
                        cmd = {
                            "jdtls",
                            "-configuration",
                            "/home/colin/.cache/jdtls/config",
                            "-data",
                            "/home/colin/.cache/jdtls/workspace"
                        },
                        init_options = {
                            jvm_args = {"-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"},
                            workspace = "/home/colin/.cache/jdtls/workspace"
                        }
                    })
                else
                    lspconfig[lsp].setup({
                        capabilities = capabilities
                    })
                end
            end
        end
    }
}
