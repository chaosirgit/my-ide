local ok,autopairs = pcall(require,"nvim-autopairs")
if not ok then
  vim.notify("nvim-autopairs not found")
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    java = false, -- don't check treesitter on java
  },
})
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
