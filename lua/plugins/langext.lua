-- 语言服务器增强插件
return {
    -- C/C++
    {
        "p00f/clangd_extensions.nvim",
        ft = {"c","cpp","cxx","C","cc","c++","cp","h","H","hh","hpp","hxx","h++","hp"},
        opts = {}
    },
    -- markdown
    {
        "mickael-menu/zk-nvim",
        ft = {"md","markdown"},
        opts = {
            picker = "telescope",
        }
    }
}
