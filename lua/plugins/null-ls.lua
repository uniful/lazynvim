return {
    -- 使用lua注入诊断、格式化、补全服务
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        event = {"BufReadPre","BufNewFile"},
        dependencies = {
            {
                "jay-babu/mason-null-ls.nvim",
                lazy = true,
                cmd = {"NullLsInstall","NullLsUninstall"},
                dependencies = "mason.nvim",
                config =function ()
                    require("mason-null-ls").setup({
                        ensure_installed = {"shellcheck"},
                        automatic_installation = false,
                        automatic_setup = true
                    })
                end
            }
        },
        config = function()
            local null_ls = require("null-ls")
            local diagnostics = null_ls.builtins.diagnostics
            local formatting = null_ls.builtins.formatting

            local sources = {
                -- Diagnostics
                diagnostics.cmake_lint, --cmake
                diagnostics.eslint, --javascript,javascriptact,typescript,typescriptact,vue
                diagnostics.fish, --fish
                diagnostics.luacheck, --lua
                diagnostics.markdownlint, --markdown
                diagnostics.pylint, --python
                diagnostics.shellcheck, --sh
                diagnostics.tidy, --html,xml
                diagnostics.yamllint, --yaml
                diagnostics.zsh, --zsh
                diagnostics.cspell.with({
                    disabled_filetypes = {"lua","c","cpp","cmake","javascript","typescript","python",
                    "sh","zsh","yaml","fish","markdown","html","xml","java"}
                }),
                -- Formatting
                formatting.gersemi, --cmake
                formatting.eslint, --javascript,javascriptact,typescript,typescriptact,vue,
                formatting.fish_indent, --fish
                formatting.jq, --json
                formatting.markdownlint, --markdown
                formatting.shellharden, --sh
                formatting.stylua, --lua,luau
                formatting.taplo, --toml
                formatting.tidy, --html,xml
                formatting.yapf, --python
            }
            null_ls.setup({
                sources = sources,
                border = "rounded",
                debug = true,
                diagnostics_format = "[#{c}] #{m} (#{s})"
            })
        end
    }
}
