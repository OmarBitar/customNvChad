-- lspconfig.lue
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- List of LSP servers
local servers = { 
  "html",
  "cssls",
  "ts_ls",  -- Use ts_ls instead of tsserver
  "volar"
}

local nvlsp = require "nvchad.configs.lspconfig"

-- Setup LSP servers with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Vue language server specific configuration
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'javascript', 'typescript', 'vue' },
      },
    },
  },
  filetypes = { 'javascript', 'typescript', 'vue' },
}

lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}