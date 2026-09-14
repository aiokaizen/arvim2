-- load defaults i.e lua_lsp (also sets capabilities, on_init & on_attach for all
-- servers via the new vim.lsp.config API — see nvchad.configs.lspconfig.defaults)
require("nvchad.configs.lspconfig").defaults()

-- Enable servers using the Neovim 0.11+ vim.lsp API.
-- capabilities/on_init/on_attach are already applied globally by defaults().
vim.lsp.enable {
  "html",
  "cssls",
  "ruff",
  "pyright",
  "ts_ls",
}
