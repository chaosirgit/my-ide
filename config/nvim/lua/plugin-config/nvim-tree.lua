local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree Not Found!")
  return
end

-- 列表操作快捷键
-- 引入 keymap 并取 nvimTreeList 为快捷键设置
local list_keys = require('keymap').nvimTreeList
nvim_tree.setup({
    -- git 状态图标
    git = {
        enable = true,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        width = 40,
        side = 'left',
        hide_root_folder = false,
        --自定义列表中的快捷键
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    system_open = {
        cmd = "",
    },
})
