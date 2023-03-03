-- 语言服务器增强插件
return {
    -- C/C++
    {
        "p00f/clangd_extensions.nvim",
        ft = {"c","cpp"},
        opts = {}
    },
    -- java
    {
        "mfussenegger/nvim-jdtls",
        ft = "java"
    }
}
