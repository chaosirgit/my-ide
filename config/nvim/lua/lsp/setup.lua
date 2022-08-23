local ok,lsp_installer = pcall(require,'nvim-lsp-installer')
if not ok then
  vim.notify("nvim-lsp-installer Not Found!")
  return
end

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  eslint = require("lsp.config.eslint"),
  dockerls = require("lsp.config.docker"),
  gopls = require("lsp.config.go"),
  html = require("lsp.config.html"),
  jsonls = require("lsp.config.json"),
  quick_lint_js = require("lsp.config.js"),
  marksman = require("lsp.config.markdown"),
  intelephense = require("lsp.config.php"),
  pylsp = require("lsp.config.python"),
  sqlls = require("lsp.config.sql"),
  solang = require("lsp.config.solidity"),
  volar = require("lsp.config.vue"),
--  yamlls = require("lsp.config.yaml"),
}
-- 自动安装 Language Servers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end
-- lsp_installer 的回调函数，这个函数会在每个 LSP Server 准备好时调用。
lsp_installer.on_server_ready(function(server)
  local config = servers[server.name]
  if config == nil then
    return
  end
  if config.on_setup then
    config.on_setup(server)
  else
    server:setup({})
  end
end)
