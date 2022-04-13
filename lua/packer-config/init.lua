vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
    use {'ms-jpq/coq_nvim', {branch = 'coq'}}
    use {'ms-jpq/coq.artifacts', {branch = 'artifacts'}}
    use {'ms-jpq/coq.thirdparty', {branch = '3p'}}
    use 'lewis6991/gitsigns.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'folke/which-key.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'lukas-reineke/indent-blankline.nvim'
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
    use 'Edeneast/nightfox.nvim'
end)
