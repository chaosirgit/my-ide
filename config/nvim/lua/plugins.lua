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
    use ({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter (代码高亮)
    -- 这里的 run = ":TSUpdate" 是 Packer.nvim 的一个 Post-install hook，表示当组件安装或更新完成时会执行 :TSUpdate 命令。
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    -- LSP
    -- lsp server installer
    use("williamboman/nvim-lsp-installer")
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })


  end)
