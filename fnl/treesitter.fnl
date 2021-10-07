(local config (require "nvim-treesitter.configs"))

(config.setup {:ensure_installed "maintained"
               :playground {:enable true}
               :indent {:enable true}
               :highlight {:enable true
                           :custom_captures {"punctuation.bracket" "none"}}})
