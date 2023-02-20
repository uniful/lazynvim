return {
    -- 使用lua注入诊断、格式化、补全服务
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = {"BufReadPre","BufNewFile"},
        config = function()
            local null_ls = require("null-ls")
            local code_actions = null_ls.builtins.code_actions
            local diagnostics = null_ls.builtins.diagnostics
            local formatting = null_ls.builtins.formatting

            local sources = {
                -- code_actions
                code_actions.eslint, -- javascript,typescript
                code_actions.shellcheck, -- sh
                code_actions.cspell.with({
                    disabled_filetypes = {"c","cpp","javascript","typescript","sh"}
                }),
                -- Diagnostics
                diagnostics.cmake_lint, --cmake
                diagnostics.eslint, --javascript,javascriptact,typescript,typescriptact,vue
                diagnostics.fish, --fish
                diagnostics.luacheck, --lua
                diagnostics.markdownlint, --markdown
                diagnostics.pylint, --python
                diagnostics.shellcheck, --sh
                diagnostics.tidy, --html,xml
                diagnostics.vint, --vim
                diagnostics.yamllint, --yaml
                diagnostics.zsh, --zsh
                diagnostics.cspell.with({
                    disabled_filetypes = {"lua","c","cpp","cmake","javascript","typescript","python",
                    "vim","sh","zsh","yaml","fish","markdown"}
                }),
                -- Formatting
                formatting.cmake_format, --cmake
                formatting.eslint, --javascript,javascriptact,typescript,typescriptact,vue,
                formatting.fish_indent, --fish
                formatting.jq, --json
                formatting.markdownlint, --markdown
                formatting.shellharden, --sh
                formatting.stylua, --lua,luau
                formatting.taplo, --toml
                formatting.tidy, --html,xml
                formatting.yapf, --python
                formatting.codespell.with({
                    disabled_filetypes = {"c","cpp","lua","cmake","python","markdown","json","html","sh",
                    "javascript","typescript"}
                })
            }
            null_ls.setup({
                sources = sources,
                debug = true,
                diagnostics_format = "[#{c}] #{m} (#{s})",
            })
        end
    }
}
