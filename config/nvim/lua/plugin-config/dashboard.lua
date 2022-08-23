local ok, dashboard = pcall(require, "dashboard")
if not ok then
  vim.notify("Dashboard Not Found!")
  return
end

dashboard.custom_footer = {
  "",
  "",
  "https://www.google.com"
}
dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keymap                    ",
    action = "edit ~/.config/nvim/lua/keymap.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
}

dashboard.custom_header = {
[[]],
[[███████╗████████╗██╗  ██╗ █████╗ ███╗   ██╗    ██╗  ██╗██╗   ██╗ ██████╗ ]],
[[██╔════╝╚══██╔══╝██║  ██║██╔══██╗████╗  ██║    ██║ ██╔╝██║   ██║██╔═══██╗]],
[[█████╗     ██║   ███████║███████║██╔██╗ ██║    █████╔╝ ██║   ██║██║   ██║]],
[[██╔══╝     ██║   ██╔══██║██╔══██║██║╚██╗██║    ██╔═██╗ ██║   ██║██║   ██║]],
[[███████╗   ██║   ██║  ██║██║  ██║██║ ╚████║    ██║  ██╗╚██████╔╝╚██████╔╝]],
[[╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ]],
[[                                                                         ]],
[[                         [ version : 1.0.0 ]                             ]],
[[]],
[[]],
}
