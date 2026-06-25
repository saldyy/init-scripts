-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_enable = false,
  ensure_installed = {
    "ts_ls", "lua_ls", "eslint", "dockerls",
    "docker_compose_language_service", "gopls",
    "golangci_lint_ls", "templ", "tailwindcss",
    "pyright", "html", "biome",
  },
})

-- Shared capabilities (extend if you use nvim-cmp / blink.cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- If using nvim-cmp:
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Apply shared defaults to ALL servers via the '*' wildcard
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- Keymaps on attach (single source of truth)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, remap = false, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
    keymap("n", "[d", vim.diagnostic.goto_next, opts)
    keymap("n", "]d", vim.diagnostic.goto_prev, opts)
    keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
    keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Enable servers (each one's config lives in lsp/<name>.lua)
vim.lsp.enable({
  "gopls",
  "lua_ls",
  "ts_ls",
  "pyright",
  "eslint",
  "tailwindcss",
  "biome",
  "golangci_lint_ls",
  "dockerls",
  "templ",
  "html",
})

-- Filetypes
vim.filetype.add({ extension = { templ = "templ" } })
