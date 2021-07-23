(local config (require "nvim-treesitter.configs"))

(config.setup {:ensure_installed "maintained"
               :indent {:enable false}
               :highlight {:enable true
                           :custom_captures {"punctuation.bracket" "none"}}})
