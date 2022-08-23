local packer = require("packer")
packer.startup(
  function(use)
    -- 插件管理工具本身
    use 'wbthomason/packer.nvim'
    -- 你的插件列表
    -- 主题
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'rktjmp/lush.nvim'
    -- 目录树
    use ({'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'})
    -- buffer
    use({'akinsho/bufferline.nvim', requires = {'kyazdani42/nvim-web-devicons','moll/vim-bbye'}})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    -- lualine lsp 扩展
    use("arkav/lualine-lsp-progress")
    -- telescope 文件模糊搜索
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
  end)
