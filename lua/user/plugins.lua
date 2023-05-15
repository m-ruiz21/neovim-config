local fn = vim.fn

-- Install packer if not already installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" 
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "kyazdani42/nvim-web-devicons"  -- web devicons
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim" 
    use "moll/vim-bbye"               -- allows us to delete buffers easier
    use "nvim-lualine/lualine.nvim"   -- status line
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use "ahmedkhalf/project.nvim"     -- for project managment
    use "lewis6991/impatient.nvim"    -- faster loadup times
    use "lukas-reineke/indent-blankline.nvim"   -- adds indentation guides
    use "goolord/alpha-nvim"          -- for the startup page
    use "folke/which-key.nvim"

	-- Colorschemes
    use "lunarvim/darkplus.nvim"    -- for a more classic vscode look
    use "dracula/vim"
    use 'marko-cerovac/material.nvim'

    -- Cmp 
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"               -- enable LSP
    use "williamboman/mason.nvim"             -- package manager for LSP
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"     -- for formatters and linters
    use "RRethy/vim-illuminate"               -- highlights other uses of word

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
 	use {
		"nvim-treesitter/nvim-treesitter",
		commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
	}

    -- Git
    use "lewis6991/gitsigns.nvim"
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
