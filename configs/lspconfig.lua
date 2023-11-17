local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require ("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities =capabilities,
  filetype = {"python"}
})
lspconfig.tsserver.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetype={"javascript"},
  init_options={
    preferences={
      disableSuggestions=true,
    }
  }
})
