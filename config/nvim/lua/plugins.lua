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
    -- 代码补全
    -- https://github.com/hrsh7th/nvim-cmp
    -- nvim-cmp 是使用 Lua 编写的 补全引擎 插件。
    -- 可以配置多种外部的补全源，
    -- 支持 vsnip、luasnip、snippy、 ultisnips 4 种 snippet 引擎
    -- snippet 引擎就是自定义代码段的引擎，常见的有 vsnip、luasnip 等
    --
    
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }




  end)
