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
                if lsp == "lua_ls" then
                    lspconfig[lsp].setup({
                        settings = {
                            lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                },
                                completion = {
                                    callSnippet = "Replace"
                                }
                            }
                        },
                        capabilities = capabilities
                    })
                elseif lsp == "jsonls" then
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
    }
}
