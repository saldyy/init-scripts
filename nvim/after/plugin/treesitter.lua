local ts = require('nvim-treesitter')

ts.setup({
  -- auto_install is still supported in the new setup
  auto_install = true,
})

-- Migrating 'ensure_installed'
ts.install({
  "javascript",
  "typescript",
  "go",
  "c",
  "lua",
  "vim",
  "vimdoc",
  "terraform",
  "dockerfile",
  "query" -- Recommended to always include 'query' for TS health
})

-- Migrating 'highlight = { enable = true }'
-- We use an autocommand to start the native Neovim TS engine
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local bufnr = args.buf
    -- This replaces the old highlight.enable = true
    pcall(vim.treesitter.start, bufnr)
  end,
})

