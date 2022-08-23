-- <Leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 全局快捷键函数
-- vim.api.nvim_set_keymap('模式','按键','映射为','options')
-- n Normal 模式 i Insert 模式 v Visual t Terminal c Command
-- options = {noremap = true,silent = true} noremap 表示不会重新映射 silent 表示不会输出多余信息
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}
-- 分屏
--   水平
map('n','<leader>ws',":sp<CR>",opt)
--   垂直
map('n',"<leader>wh",":vsp<CR>",opt)
--   关闭当前
map('n',"<leader>wcc","<C-w>c",opt)
--   关闭其他
map('n',"<leader>wca","<C-w>o",opt)
--   跳转
map('n',"<A-Up>","<C-w>k",opt)
map('n',"<A-Down>","<C-w>j",opt)
map('n',"<A-Left>","<C-w>h",opt)
map('n',"<A-Right>","<C-w>l",opt)
-- 命令行
map('n',"<leader>ts",":sp | terminal<CR>",opt)
map('n',"<leader>th",":vsp | terminal<CR>",opt)
map('t',"<Esc>","<C-\\><C-n><C-w>c",opt)
map('t',"<A-Up>",[[ <C-\><C-N><C-w>k ]],opt)
map('t',"<A-Down>",[[ <C-\><C-N><C-w>j ]],opt)
map('t',"<A-Left>",[[ <C-\><C-N><C-w>h ]],opt)
map('t',"<A-Right>",[[ <C-\><C-N><C-w>l ]],opt)
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
map("n","<leader>o",":Telescope find_files<CR>",opt)
-- 全局搜索
map("n","<leader>f",":Telescope live_grep<CR>",opt)


-- nvim-tree
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree Not Found!")
  return
end

local pluginKeys = {}
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- <leader>-1 打开关闭 tree
map('n',"<leader>1",":NvimTreeToggle<CR>",opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>","o","<2-LeftMouse>","<Right>"}, action = "edit" },
  { key = {"<Left>"}, cb = tree_cb('close_node') },
  -- 分屏打开文件
  { key = "h" , action = "vsplit" },
  { key = "s" , action = "split" },
  { key = "i" , cb = tree_cb('preview') },
  -- 显示隐藏文件
  { key = ".", action = "toggle_dotfiles"},
  { key = ".", action = "toggle_custom" },
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
return pluginKeys


