-- <Leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 全局快捷键函数
-- vim.api.nvim_set_keymap('模式','按键','映射为','options')
-- n Normal 模式 i Insert 模式 v Visual t Terminal c Command
-- options = {noremap = true,silent = true} noremap 表示不会重新映射 silent 表示不会输出多余信息
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
-- 分屏
--   水平
map('n', '<leader>ws', ":sp<CR>", opt)
--   垂直
map('n', "<leader>wh", ":vsp<CR>", opt)
--   关闭当前
map('n', "<leader>wcc", "<C-w>c", opt)
--   关闭其他
map('n', "<leader>wca", "<C-w>o", opt)
--   跳转
map('n', "<A-Up>", "<C-w>k", opt)
map('n', "<A-Down>", "<C-w>j", opt)
map('n', "<A-Left>", "<C-w>h", opt)
map('n', "<A-Right>", "<C-w>l", opt)
-- 命令行
map('n', "<leader>ts", ":sp | terminal<CR>", opt)
map('n', "<leader>th", ":vsp | terminal<CR>", opt)
map('t', "<Esc>", "<C-\\><C-n><C-w>c", opt)
map('t', "<A-Up>", [[ <C-\><C-N><C-w>k ]], opt)
map('t', "<A-Down>", [[ <C-\><C-N><C-w>j ]], opt)
map('t', "<A-Left>", [[ <C-\><C-N><C-w>h ]], opt)
map('t', "<A-Right>", [[ <C-\><C-N><C-w>l ]], opt)
-- 上下移动选中文本
map("v", "j", ":move '>+1<CR>gv-gv", opt)
map("v", "k", ":move '<-2<CR>gv-gv", opt)
-- bufferline
-- 左右Tab切换
map("n", "<Leader><Left>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Leader><Right>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<Leader>bd", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
-- 插件快捷键

-- Telescope
-- 查找文件
map("n", "<leader>o", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)

-- nvim-treesitter
-- 全文缩进
map("n", "<leader>=", "gg=G<C-o>", opt)


-- nvim-tree

local pluginKeys = {}
-- <leader>-1 打开关闭 tree
map('n', "<leader>1", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { "<CR>", "o", "<2-LeftMouse>", "<Right>" }, action = "edit" },
  { key = { "<Left>" }, action = 'close_node' },
  -- 分屏打开文件
  { key = "h", action = "vsplit" },
  { key = "s", action = "split" },
  { key = "i", action = 'preview' },
  -- 显示隐藏文件
  { key = ".", action = "toggle_dotfiles" },
  -- 文件操作
  { key = "R", action = "refresh" },
  { key = "n", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "v", action = "paste" },
}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- LSP 回调函数快捷键设置
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, bufopts)
--  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
pluginKeys.mapLSP = function(mapbuf)
  --rename
  mapbuf('n', "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --参数换位
  mapbuf('n', "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  -- 跳转到定义
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  -- 悬浮显示
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  -- 声明
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- 实现
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- 参考
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>F", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 出现补全
    ["<A-p>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-q>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  }
end


return pluginKeys
