(require "treesitter")

(let [diaglist (require "diaglist")]
  (diaglist.init))

(vim.cmd (.. "colorscheme " "everforest"))
(local null_ls
  (require "null-ls"))

(let [diagnostics null_ls.builtins.diagnostics]
  (null_ls.setup
    {:sources [diagnostics.flake8
               diagnostics.gccdiag]}))
