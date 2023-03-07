-- 语言服务器增强插件
return {
    -- C/C++
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        ft = {"c","cpp"},
        opts = {}
    },
    -- java
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
        ft = "java",
        config = function ()
            require("ftplugin.java")
        end
    }
}
