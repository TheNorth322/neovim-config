local nvlsp = require("nvchad.configs.lspconfig")
local servers = { "clangd", "basedpyright", "neocmake" }

nvlsp.defaults()

-- Neocmake configuration
vim.lsp.config("neocmake", {
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_markers = { "CMakeLists.txt", ".git" },
  single_file_support = true,
  capabilities = nvlsp.capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
})

vim.lsp.enable(servers)
