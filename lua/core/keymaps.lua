vim.g.mapleader = ';'
vim.g.maplocalleader = ','

local kopts = {noremap = true, silent = true}
local bufopts = {noremap = true, silent = true, buffer = bufnr}

local function mapkey(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, kopts)
end

local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', kopts)
end

local function maplua(key, txt)
    vim.api.nvim_set_keymap('n', key, ':lua '..txt..'<cr>', kopts)
end

local function mapnorm(key,txt)
    vim.api.nvim_set_keymap('n',key,''..txt..'<cr>',kopts)
end

local function maptext(key,txt)
    vim.api.nvim_set_keymap('n',key,':'..txt..'',kopts)
end

-------------------------按键映射(keymap)按照字母表排序--------------------------

-- A
-- auto-save
-- 关闭或启用自动保存功能
mapcmd("<leader>at", "ASToggle")


-- B:
-- bufferline
-- 切换上一个缓冲区
mapcmd("<A-p>", "BufferLineCyclePrev")
-- 切换下一个缓冲区
mapcmd("<A-r>", "BufferLineCycleNext")
-- 关闭左侧缓冲区
mapcmd("<leader>bl", "BufferLineCloseLeft")
-- 关闭右侧缓冲区
mapcmd("<leader>br", "BufferLineCloseRight")
-- 缓冲区关闭设置由BufDel插件提供
-- 关闭当前缓冲区
mapcmd("<leader>bd","BufDel")
-- 关闭当前缓冲区并忽略更改
mapcmd("<leader>bi","BufDel!")
-- 关闭选定的缓冲区(如果缓冲区名称为纯数字，则使用引号)
maptext("<leader>bs","BufDel ")


-- C
-- 快捷命令
mapkey('n', '<leader>ce', ':e<space>')
mapkey("n", "<leader>,", ":")
mapcmd('<leader>cw', 'w')
mapcmd('<leader>cW', 'wa')
mapcmd('<leader>cE', 'e!')
mapcmd('<leader>cq', 'q')
mapcmd('<leader>cQ', 'q!')
mapcmd('<leader>cx', 'x')

-- 健康检查
mapcmd("<leader>ch","checkhealth")

-- clangd_extensions
-- 将光标放在所需的符号上
mapcmd("<leader>cs","ClangdSymbolInfo")
-- 将光标放在所需类型或该类型的符号上
mapcmd("<leader>cl","ClangdTypeHierarchy")
-- 查看内存使用情况
mapcmd("<leader>cg", "ClangdMemoryUsage expand_preamble")


-- D
-- dap
-- 开启调试或到下一个断点处
mapcmd("<F5>", "DapContinue")
-- 单步进入执行（会进入函数内部，有回溯阶段）
mapcmd("<F6>", "DapStepInto")
-- 单步跳过执行（不进入函数内部，无回溯阶段）
mapcmd("<F7>", "DapStepOver")
-- 步出当前函数
mapcmd("<F8>", "DapStepOut")
-- 直接加载json文件调试
mapcmd("<leader>dj", "DapLoadLaunchJSON")
-- 显示调试日志
mapcmd("<leader>dg", "DapShowLog")
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
maplua("<F10>","require'dap'.close()")
mapcmd("<leader>dt","DapToggleRepl")
mapcmd("<leader>dr","DapVirtualTextForceRefresh")
-- 开启或关闭虚拟文本
mapcmd("<leader>dvd", "DapVirtualTextDisable")
mapcmd("<leader>dve", "DapVirtualTextEnable")
mapcmd("<leader>dvr", "DapVirtualTextForceRefresh")
mapcmd("<leader>dvt", "DapVirtualTextToggle")
-- 打断点
mapcmd("<leader>db", "DapToggleBreakpoint")
-- 小部件UI
 vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
end,{desc="dap.ui.widgets hover"})
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end,{desc="dap.ui.widgets preview"})
vim.keymap.set('n', '<Leader>dc', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end,{desc="dap.ui.widgets float centered frames"})
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end,{desc="dap.ui.widgets float centered scopes"})

-- diffview
-- 查看所有文件历史
mapcmd("<leader>dvh", "DiffviewFileHistory")
-- 查看当前文件历史
mapcmd("<leader>dvf", "DiffviewFileHistory %")
-- 查找特定文件或目录历史
maptext("<leader>dvs", "DiffviewFileHistory ")
-- 打开文件差异视图
mapcmd("<leader>dvo", "DiffviewOpen")
-- 关闭文件差异视图
mapcmd("<leader>dvc", "DiffviewClose")
-- 切换文件面板
mapcmd("<leader>dvt", "DiffviewToggleFiles")


-- E


-- F
-- fzf
-- 功能选择
maptext("<leader>fs", "FzfLua ")
-- 直接查找文件
mapcmd("<leader>ff", "FzfLua files")
-- 带参数查找
maptext("<leader>fp","FzfLua files cwd=")
-- 打开缓冲区
mapcmd("<leader>fb", "FzfLua buffers")
-- 打开文件历史
mapcmd("<leader>fo", "FzfLua oldfiles")
-- 快速修复列表
mapcmd("<leader>fq", "FzfLua quickfix")
-- 打开标签
mapcmd("<leader>ft", "FzfLua tabs")
-- 参数列表
mapcmd("<leader>fa", "FzfLua args")


-- G
-- gitsigns
mapcmd("<leader>gi", "Gitsigns")
mapcmd('<leader>gg', 'Gitsigns stage_buffer')
mapcmd('<leader>gu', 'Gitsigns undo_stage_hunk')
mapcmd('<leader>gb', 'Gitsigns reset_buffer')
mapcmd('<leader>gh', 'Gitsigns preview_hunk')
mapcmd("<leader>gn", "Gitsigns toggle_signs")
mapcmd('<leader>gc', 'Gitsigns toggle_current_line_blame')
mapcmd('<leader>gf', 'Gitsigns diffthis')
mapcmd('<leader>ge', 'Gitsigns toggle_deleted')
maplua('<leader>gl', 'require"gitsigns".blame_line{full=true}')
maplua('<leader>gs', 'require"gitsigns".diffthis("~")')

-- neogit
mapcmd("<leader>got", "Neogit")
mapcmd("<leader>goc", "Neogit commit")
maptext("<leader>gok", "Neogit kind=")


-- H
-- hlslens
-- 启动或关闭nvim-hlslens
mapcmd("<Leader>hst", "HlSearchLensToggle")
-- 启用nvim-hlslens
mapcmd("<leader>hse", "HlSearchLensEnable")
-- 禁用nvim-hlslens
mapcmd("<leader>hsd", "HlSearchLensDisable")
-- 关闭搜索词高亮显示
mapcmd("<leader>hn", "noh")
vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- hlargs
maplua("<leader>hge", "require('hlargs').enable()")
maplua("<leader>hgd", "require('hlargs').disable()")
maplua("<leader>hgt", "require('hlargs').toggle()")


-- I
-- illuminate
-- 暂停
mapcmd("<leader>ip","IlluminatePause")
-- 恢复
mapcmd("<leader>ir","IlluminateResume")
--暂停/恢复切换
mapcmd("<leader>ig","IlluminateToggle")
--本地缓冲区暂停
mapcmd("<leader>if","IlluminatePauseBuf")
--本地缓冲区恢复
mapcmd("<leader>iu","IlluminateResumeBuf")
--本地缓冲区恢复/暂停切换
mapcmd("<leader>it","IlluminateToggleBuf")


-- J


-- K


-- L
-- lazy
mapcmd("<leader>la", "Lazy")

-- lspconfig自带功能
maplua('<leader>lf', 'vim.diagnostic.open_float()')
maplua("<leader>lp", "vim.diagnostic.goto_prev()")
maplua("<leader>ln", "vim.diagnostic.goto_next()")
maplua('<leader>lq', 'vim.diagnostic.setloclist()')
vim.keymap.set('n', '<leader>lce', vim.lsp.buf.declaration,{desc="Lsp Buf Declaration"}, bufopts)
vim.keymap.set('n', '<leader>lcd', vim.lsp.buf.definition,{desc="Lsp Buf Definition"}, bufopts)
vim.keymap.set('n', '<leader>lch', vim.lsp.buf.hover,{desc="Lsp Buf Hover"}, bufopts)
vim.keymap.set('n', '<leader>lci', vim.lsp.buf.implementation,{desc="Lsp Buf Implementation"}, bufopts)
vim.keymap.set('n', '<leader>lcs', vim.lsp.buf.signature_help,{desc="Lsp Buf Signature Help"}, bufopts)
vim.keymap.set('n', '<leader>lca', vim.lsp.buf.add_workspace_folder,{desc="Lsp Buf Add Workspace Folder"}, bufopts)
vim.keymap.set('n', '<leader>lcm', vim.lsp.buf.remove_workspace_folder,{desc="Lsp Buf Remove Workspace Folder"}, bufopts)
vim.keymap.set('n', '<leader>lcl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end,{desc="Lsp Buf List Workspace Folder"}, bufopts)
vim.keymap.set('n', '<leader>lct', vim.lsp.buf.type_definition,{desc="Lsp Buf Type Definition"}, bufopts)
vim.keymap.set('n', '<leader>lcn', vim.lsp.buf.rename,{desc="Lsp Buf Rename"},bufopts)
vim.keymap.set('n', '<leader>lcc', vim.lsp.buf.code_action,{desc="Lsp Buf Code Action"}, bufopts)
vim.keymap.set('n', '<leader>lcr', vim.lsp.buf.references,{desc="Lsp Buf References"}, bufopts)
vim.keymap.set('n', '<leader>lcf', function() vim.lsp.buf.format { async = true } end,{desc="Lsp Buf Format"}, bufopts)

-- 查看language-server信息
mapcmd("<leader>li", "LspInfo")
mapcmd("<leader>ls", "LspStart")
mapcmd("<leader>lt", "LspStop")
mapcmd("<leader>lr", "LspRestart")

-- lspsaga
-- 显示缓冲区诊断
mapcmd("<leader>lgb", "Lspsaga show_buf_diagnostics")
-- 代码活动
vim.keymap.set({"n","v"},"<leader>lgc","<cmd>Lspsaga code_action<CR>")
-- 显示光标诊断
mapcmd("<leader>lgd", "Lspsaga show_cursor_diagnostics")
-- 重命名
mapcmd("<leader>lgr", "Lspsaga rename")
-- 为所选的重命名出现悬停词
mapcmd("<leader>lgp",  "Lspsaga rename ++project")
-- 查看定义，也可以编辑包含定义的文件
mapcmd("<leader>lgf", "Lspsaga peek_definition")
-- 跳转到定义
mapcmd("<leader>lgg", "Lspsaga goto_definition")
-- 查看类型定义,可以编辑定义文件，<c-t>向后跳转
mapcmd("<leader>lgy", "Lspsaga peek_type_definition")
-- 跳转到类型定义
mapcmd("<leader>lgx", "Lspsaga goto_type_definition")
-- 悬浮文档
mapcmd("<leader>lgh", "Lspsaga hover_doc")
-- 直接调用是文档在右上角，如果先不传递参数，那么则是关闭文档,如果想跳转到悬停窗口，<c-w>w
mapcmd("<leader>lgk", "Lspsaga hover_doc ++keep")
-- 显示线路诊断
mapcmd("<leader>lgl", "Lspsaga show_line_diagnostics")
-- 大纲切换
mapcmd("<leader>lgo", "Lspsaga outline")
-- 调用层级
mapcmd("<Leader>lgi", "Lspsaga incoming_calls")
mapcmd("<Leader>lgt", "Lspsaga outgoing_calls")
-- 浮动终端
mapcmd("<leader>lgm", "Lspsaga term_toggle")
-- 查找符号定义，如果没有定义则隐藏，使用,<c-t>跳回
mapcmd("<leader>lgn", "Lspsaga lsp_finder")


-- M
-- mason
mapcmd("<leader>ms", "Mason")
-- 安装服务
maptext("<leader>mi", "MasonInstall ")
-- 卸载服务
maptext("<leader>mu", "MasonUninstall ")
-- 卸载所有
mapcmd("<leader>ma", "MasonUninstallAll")
-- 查看日志
mapcmd("<leader>ml", "MasonLog")


-- N
-- 文件浏览树(neo-tree)
-- 打开文件浏览树
mapcmd("<leader>nt", "Neotree")
-- 关闭文件浏览树
mapcmd("<leader>nc", "Neotree close")
--打开文件浏览树，显示您打开的缓冲区
mapcmd("<leader>nb", "Neotree buffers")
--打开或关闭树。采用可选的路径参数
mapcmd("<leader>ng", "Neotree toggle")
-- 显示浮动窗口
mapcmd("<leader>nf", "Neotree float")
-- 自己选择左侧或右侧打开
maptext("<leader>nd", "Neotree filesystem reveal ")

-- null-ls
mapcmd("<leader>nl", "NullLsLog")
mapcmd("<leader>ni", "NullLsInfo")

-- notify
maplua("<leader>nh", "require('notify').history()")
-- 显示历史日志
mapcmd("<leader>ns", "Notifications")

-- contect_vt
-- 切换上下文虚拟文本
mapcmd("<leader>nv", "NvimContectVtToggle")

-- numb
maplua("<leader>nue", "require('numb').setup()")
maplua("<leader>nud", "require('numb').disable()")


-- O


-- P


-- Q


-- R


-- S
-- strartuptime
mapcmd("<leader>st","StartupTime")

-- search
mapkey('n', '<leader>sw', '/\\<lt>\\><left><left>')

-- specs
-- 打开/关闭
maplua("<leader>slt", "require('specs').toggle()")
-- 插件调用
maplua("<M-s>", "require('specs').show_specs()")

-- Sidebar
mapcmd("<leader>sbt","SidebarNvimToggle")
mapcmd("<leader>sbo","SidebarNvimOpen")
mapcmd("<leader>sbc","SidebarNvimClose")
mapcmd("<leader>sbu","SidebarNvimUpdate")
mapcmd("<leader>sbf","SidebarNvimFocus")
maptext("<leader>sbr","SidebarNvimResize ")


-- T
-- ToggleTerm
-- 退出终端插入模式
mapkey("t", "<Esc>", "<C-\\><C-n>")
-- 打开终端
mapcmd("<leader>ttf", "ToggleTerm")
-- 用特定操作打开终端
maptext("<leader>tte", "TermExec ")

-- todo-comments
-- 查找 TODO 标签
mapcmd("<leader>tdt", "TodoTelescope theme=ivy")
-- 筛选关键词
maptext("<leader>tdg", "TodoTelescope keywords=")
-- 指定搜索目录
maptext("<leader>tdd", "TodoTrouble cwd=")
-- 使用快速修复列表来显示项目中的所有待办事项
mapcmd("<leader>tdq", "TodoQuickFix")
-- 使用位置列表来显示项目中的所有待办事项
mapcmd("<leader>tdl", "TodoLocList")

-- telescope
mapcmd("<leader>tsw", "Telescope find_files theme=ivy")
mapcmd("<leader>tsg", "Telescope live_grep theme=ivy")
mapcmd("<leader>tsb", "Telescope buffers theme=ivy")
mapcmd("<leader>tsh", "Telescope help_tags theme=ivy")
mapcmd("<leader>tso", "Telescope oldfiles theme=ivy")
mapcmd("<leader>tsm", "Telescope marks theme=ivy")
-- notify
mapcmd("<leader>tsn", "Telescope notify theme=ivy")
-- projects
mapcmd("<leader>tsp", "Telescope projects")
-- file_browser
mapcmd("<leader>tse", "Telescope file_browser")
-- frecency
mapcmd("<leader>tsr", "Telescope frecency theme=ivy")
-- 查看harpoon标记
mapcmd("<leader>tss", "Telescope harpoon marks")
-- 查看yank历史
mapcmd("<leader>tsy", "Telescope yank_history")

-- treesitter-context
mapcmd("<leader>tre", "TSContextEnable")
mapcmd("<leader>trd", "TSContextDisable")
mapcmd("<leader>trt", "TSContextToggle")

-- trailblazer
-- 标记字符
mapcmd("<leader>tbn", "TrailBlazerNewTrailMark")
-- 移动到最后一个标记并且删除此标记
mapcmd("<leader>tbb", "TrailBlazerTrackBack")
-- 切换到前一个轨迹标记
mapcmd("<leader>tbu", "TrailBlazerPeekMovePreviousUp")
-- 切换到最新的轨迹标记
mapcmd("<leader>tbd", "TrailBlazerPeekMoveNextDown")
-- 移动到缓冲区最近的轨迹标记
mapcmd("<leader>tbr", "TrailBlazerMoveToNearest")
-- 删除所有标记
mapcmd("<leader>tba", "TrailBlazerDeleteAllTrailMarks")


-- U


-- V


-- W
-- window
mapkey('n', '<leader>wh', '<c-w>h')
mapkey('n', '<leader>wj', '<c-w>j')
mapkey('n', '<leader>wk', '<c-w>k')
mapkey('n', '<leader>wl', '<c-w>l')
mapkey('n', '<leader>w1', '<c-w>o')
mapkey("n", "<leader>wv", "<c-w>v") -- 水平新增窗口
mapkey("n", "<leader>ws", "<c-w>s") -- 垂直新增窗口
mapcmd('<leader>wx', 'x')
mapcmd('<leader>w2', 'sp')
mapcmd('<leader>w3', 'vs')
-- window resize
mapkey('n', '<m-9>', '<c-w><')
mapkey('n', '<m-0>', '<c-w>>')
mapkey('n', '<m-->', '<c-w>-')
mapkey('n', '<m-=>', '<c-w>+')
mapkey('n', '<m-r>', 'resize<space>')
mapkey('n', '<m-t>', 'vertical resize<space>')
--单行或多行移动
mapkey("v", "J", ":m '>+1<CR>gv=gv")
mapkey("v", "K", ":m '<-2<CR>gv=gv")

-- X
-- Trouble
mapcmd("<leader>xt", "TroubleToggle")
mapcmd("<leader>xw", "TroubleToggle workspace_diagnostics")
mapcmd("<leader>xd", "TroubleToggle document_diagnostics")
mapcmd("<leader>xq", "TroubleToggle quickfix")
mapcmd("<leader>xl", "TroubleToggle loclist")
mapcmd("<leader>xr", "TroubleToggle lsp_references")


-- Y


-- Z


------ 其它命令 -------
-- 手动调用命令执行
maplua("<leader>cu","require('implement.code_action_utils').code_action_listener()")

-- 查看lazygit日志
vim.keymap.set("n","<leader>lzl",function()
    require("lazy.util").float_term({ "lazygit","log" })
end)
