-- 自动缩进策略
vim.opt.filetype      = "plugin"
-- 开启语法高亮
vim.opt.syntax        = "enable"
vim.g.vimsyn_embed    = '1'
-- 防止包裹
vim.o.wrap            = false
-- 默认新窗口在右和下
vim.o.splitright      = true
vim.o.splitbelow      = true
-- 行号显示 绝对行号和相对行号
vim.o.number          = true
vim.o.relativenumber  = true
-- 显示标尺
vim.o.ruler           = true
-- 无操作时候交换文件写入磁盘等待的时间
vim.o.updatetime      = 100
-- 高亮当前文本行
vim.o.cursorline      = true
-- 等待按键时长的时间
vim.o.timeout         = true
vim.o.timeoutlen      = 500
-- 外部修改时自动加载
vim.o.autowrite       = true
vim.o.autoread        = true
-- 退出时提示确认
vim.o.confirm         = true
-- 编码设置和检测
vim.g.encoding        = "UTF-8"
vim.o.fileencodings   = "utf-8,gbk,gb2312,gb18030,utf-16,ucs-bom"
-- 显示左侧图标指示列
vim.wo.signcolumn     = "yes"
-- 搜索设置
vim.o.ignorecase      = true
vim.o.smartcase       = true
vim.o.incsearch       = true
vim.o.hlsearch        = true
-- 拼写建议
vim.o.spell           = true
vim.opt.spelllang     = {'en_us'}
-- 鼠标支持
vim.opt.mouse:append("a")
-- 启用系统剪切板
vim.opt.clipboard:append("unnamedplus")
-- 缓存文件设置
vim.o.backup          = false
vim.o.writebackup     = false
vim.o.swapfile        = false
-- 显示特殊字符
vim.o.list            = true
-- 空格占用以.显示
vim.o.listchars       = "space:·,tab:··,eol:↴"
-- complete plus
vim.o.wildmenu        = true
-- 终端24位色彩支持
vim.o.termguicolors   = true
if (vim.fn.has('termguicolors') == 1) then
    vim.o.termguicolors = true
end
-- 设置缩进
vim.o.autoindent      = true
vim.o.tabstop         = 4
vim.o.shiftwidth      = 4
vim.o.softtabstop     = 4
vim.o.expandtab       = true
vim.o.shiftround      = true
-- 插入括号时短暂跳转到另一半括号
vim.o.showmatch       = true
-- 自动补全不自动选中
vim.opt.completeopt:append("menu,menuone,noselect,noinsert")
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap       = "<,>,[,]"
-- 补全最多显示16行
vim.o.pumheight       = 16
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode        = false
-- redrawtime
vim.o.redrawtime      = 10000
-- 语言
vim.o.langmenu        = "zh_CN.UTF-8"
-- 开启folding
vim.wo.foldlevel      = 99
vim.o.foldcolumn      = '1'
vim.o.foldlevelstart  = 99
vim.o.foldenable      = true
vim.o.foldmethod      = "expr"
vim.o.foldexpr        = "nvim_treesitter#foldexpr()"

-- disable some useless standard plugins to save startup time
-- 禁用命令如下
-- vim.g.loaded_matchparen        = 1
vim.g.markdown_fenced_languages={
    "ts=typescript"
}
