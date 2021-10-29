(require "treesitter")

;(local instant (require "instant"))
(local theme (os.getenv "XTHEME"))

(set vim.g.instant_username
     (or vim.g.instant_username
         (with-open [process (io.popen "git config --get user.name")]
           (process:read))
         (os.getenv "USER")))

(require "instant_client")
(require "instant_server")
(vim.cmd (.. "colorscheme " theme))

(if (= theme "onedark")
  (set vim.g.rainbow_guifgs ["#61AFEF"
                             "#E06C75"
                             "#56B6C2"
                             "#98C379"
                             "#E5C07B"]))
