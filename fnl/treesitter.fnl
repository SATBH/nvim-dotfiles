(local config (require "nvim-treesitter.configs"))

(config.setup {:ensure_installed "maintained"
               :playground {:enable true}
               :indent {:enable false}
               :highlight {:enable true
                           :custom_captures {"punctuation.bracket" "none"}}})
