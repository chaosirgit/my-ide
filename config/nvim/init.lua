-- 基础配置
require('basic')
-- 快捷键配置
require('keymap')
-- 插件管理
require('plugins')
-- 主题配置
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
-- bufferline
require('plugin-config.bufferline')
-- lualine
require("plugin-config.lualine")
-- telescope
require("plugin-config.telescope")
-- dashboard
require("plugin-config.dashboard")
-- project
require("plugin-config.project")
-- treesitter 代码高亮
require("plugin-config.nvim-treesitter")
-- LSP
require("lsp.setup")
-- 自动补全
require("lsp.cmp")
-- 成对儿输入
require("plugin-config.autopairs")
-- 注释
require("plugin-config.comment")
