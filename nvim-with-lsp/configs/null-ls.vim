lua <<EOF
require("null-ls").config({
  filetypes = {"typescript", "typescriptreact", "css", "scss", "javascript", "javascriptreact", "markdown"},
  sources = { 
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.formatting.prettier,
  }
})
require('lspconfig')["null-ls"].setup{}
EOF
