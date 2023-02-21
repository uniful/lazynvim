-- 语言服务器增强插件
return {
    -- C/C++
    {
        "p00f/clangd_extensions.nvim",
        event = {"BufReadPost","BufNewFile"},
        opts = {}
    }
}
