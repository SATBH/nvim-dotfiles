(macro do-on [function ...]
  `(do ,(table.unpack (icollect [_ body (ipairs [...])]
                                (list function (if (list? body)
                                                 (table.unpack body)
                                                 body))))))

((. (require "packer") :startup)
 #(do-on $1
   :nvim-treesitter/nvim-treesitter
   :bakpakin/fennel.vim
   :wbthomason/packer.nvimk
   :sainnhe/everforest
   :jose-elias-alvarez/null-ls.nvim
   {1 "bhurlow/vim-parinfer" :ft [:lisp :fennel]}
   "nvim-telescope/telescope.nvim"
   {1 "onsails/diaglist.nvim"
     :module "diaglist"
     :config #(let [diaglist (require "diaglist")]
                (diaglist.init))}
   "nvim-lua/plenary.nvim"))

(let [treesitter (require "nvim-treesitter.configs")]
  (treesitter.setup {:ensure_installed "maintained"
                     :playground       {:enable  true}
                     :indent           {:enable  false}
                     :highlight        {:enable  true
                                        :disable [:commonlisp :python]}}))

(vim.cmd (.. "colorscheme " "everforest"))

(let [null_ls (require "null-ls")
      diagnostics null_ls.builtins.diagnostics]
  (null_ls.setup
    {:sources [diagnostics.flake8
               diagnostics.gccdiag]}))

(let [options [:exrc :list :expandtab :termguicolors :hidden]]
  (each [_ option (ipairs options)]
    (tset vim.opt option true)))

(set vim.opt.shiftwidth 2)
(set vim.opt.tabstop 2)
(set vim.g.mapleader " ")

(do-on vim.api.nvim_set_keymap
             (:n "<leader><leader>" "" {})
             (:n "<leader>dw" "<cmd> lua require('diaglist').open_alldiagnostics()<cr>" {}))
