local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- local lspconfig = require "lspconfig"
local lspconfig = require "lspconfig"

-- local servers = { "html", "cssls", "tsserver", "clangd" }

local servers = {  "html", "marksman", "clangd", "gopls", "cssls" , "pylsp", "tailwindcss", "tsserver"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

