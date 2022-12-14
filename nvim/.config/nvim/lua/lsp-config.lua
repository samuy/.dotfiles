local vim = vim
local coq = require("coq")
local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").setup()

local function common_on_attach()
  require("lsp_signature").on_attach({
    -- auto_close_after = 5,
    -- bind = true,
    -- handler_opts = {
    --   border = "single"
    -- },
    hint_prefix = "",
    use_lspsaga = true,
  })
end

for _, server in ipairs { "bashls", "gopls", "sqls", "tsserver", "svelte", "html" } do
  lsp[server].setup(coq.lsp_ensure_capabilities({
    on_attach = function(client, bufnr)
      require("nvim-navic").attach(client, bufnr)
    end
  }))
end

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { text = "", numhl = "LspDiagnosticsDefaultError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { text = "", numhl = "LspDiagnosticsDefaultWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { text = "", numhl = "LspDiagnosticsDefaultInformation" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { text = "", numhl = "LspDiagnosticsDefaultHint" }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
  }
)

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
