local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "html",
  "cssls",
  "jsonls",
  "ts_ls",
  "phpactor",
  "clangd",
  "pyright",
  "tailwindcss",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Omnisharp
lspconfig.omnisharp.setup {
  cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- ESLint LSP for JS/TS
lspconfig.eslint.setup {
  cmd = { "vscode-eslint-language-server", "--stdio" }, -- mason installs this
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  settings = {
    validate = "on",
    format = { enable = false }, -- conform.nvim should handle formatting
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
