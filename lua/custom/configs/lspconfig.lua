local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig.nvim_jdtls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"java"},
--   cmd = {'/path/to/jdt-language-server/bin/jdtls'},
--   root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- })
--
-- lspconfig.clangd.setup{
--   on_attach = function (client,bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client,bufnr)
--   end,
--   capabilities = capabilities,
--   -- filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto" },
--   -- root_dir=lspconfig.util.root_pattern(
--   --         '.clangd',
--   --         '.clang-tidy',
--   --         '.clang-format',
--   --         'compile_commands.json',
--   --         'compile_flags.txt',
--   --         'configure.ac',
--   --         '.git'
--   --       )
-- }
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}


lspconfig.jdtls.setup{}

lspconfig.tsserver.setup{}
lspconfig.tailwindcss.setup{}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go","gomod","gowork","gotmpl"},
  root_dir = util.root_pattern("go.work","go.mod",".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true
      }
    }
  }

}




