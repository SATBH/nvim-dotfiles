(local lsp (require "lspconfig")) 
(local completion (require "completion"))

(local on_attach
  (fn [client bufnr]
    (completion.on_attach)
    (local buf_set_option vim.api.nvim_buf_set_option)
    (buf_set_option  bufnr "omnifunc" "v:lua.vim.lsp.omnifunc")))

(lsp.pyright.setup {: on_attach
                    :flags {:debounce_text_changes 150}})
