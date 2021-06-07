(local config (require "nvim-treesitter.configs"))

(config.setup {:ensure_installed "maintained"
               :highlight {:enable true
                           :custom_captures {"punctuation.bracket" "none"}}})
