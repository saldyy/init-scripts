local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')


Plug('nvim-lua/plenary.nvim')

Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.2' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

Plug('navarasu/onedark.nvim')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug('mbbill/undotree')

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

Plug('neovim/nvim-lspconfig')

Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')

Plug('justinmk/vim-sneak')
Plug('tpope/vim-surround')

Plug('akinsho/toggleterm.nvim', { ['tag'] = '*' })

Plug('ThePrimeagen/harpoon')

Plug('kdheepak/lazygit.nvim')
Plug('tpope/vim-fugitive')

Plug('supermaven-inc/supermaven-nvim')

Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })
Plug('supermaven-inc/supermaven-nvim')

vim.call('plug#end')

require("toggleterm").setup()
