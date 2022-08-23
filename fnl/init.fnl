(import-macros { : consume
                 : toggle
                 : set-if-nil} :macros)

(fn config [vim]
  (local {: last-selection-range} (require :utils))

  (if (not (= (os.getenv "TERM") "linux"))
    (vim.cmd "set termguicolors"))

  (let [treesitter (require "nvim-treesitter.configs")
        languages [:c :python :rust :fennel :lua :python :markdown :fish
                   :javascript :scheme]]
    (treesitter.setup {:ensure_installed languages
                       :highlight {:enable true}}))

  (set vim.opt.laststatus 0)
  (set vim.opt.tabstop 2)
  (set vim.opt.shiftwidth 2)
  (set vim.g.maplocalleader ",")
  (vim.cmd "let g:conjure#filetype#fennel = \"conjure.client.fennel.stdio\"")
  ;(tset vim.go "conjure#filetype#fennel" "conjure.client.fennel.stdio")

  (vim.keymap.set :n "  " "<C-^>" {})

  (var current-zen-mode nil)    
  (let [true-zen (require :true-zen)
        key-handler (fn [f]
                     #(if current-zen-mode
                        ((consume current-zen-mode))
                       (do
                         (set current-zen-mode f)
                         (current-zen-mode $...))))]
    (true-zen.setup {:modes {:ataraxis {:minimum_writing_area {:width 80}}
                             :minimalist {:options {:showcmd true}}
                             :narrow   {:folds_style "invisible"}}})
    (vim.keymap.set :n :<Tab> (key-handler true-zen.ataraxis))
    (vim.keymap.set :v :<Tab> #(do (vim.api.nvim_input "<Esc>")
                                   (vim.defer_fn
                                     #((key-handler true-zen.narrow) (last-selection-range))
                                     0))))
  (vim.api.nvim_create_autocmd
    [:QuitPre]
    {:callback (fn [] (when current-zen-mode ((consume current-zen-mode))))})

  (vim.cmd "set expandtab")
  (vim.cmd "map z <Plug>(easymotion-prefix)" {})
  (vim.cmd "colorscheme nord"))
