local function _1_(_241)
  _241("nvim-treesitter/nvim-treesitter")
  _241("bakpakin/fennel.vim")
  _241("wbthomason/packer.nvimk")
  _241("sainnhe/everforest")
  _241("jose-elias-alvarez/null-ls.nvim")
  _241({"bhurlow/vim-parinfer", ft = {"lisp", "fennel"}})
  _241("nvim-telescope/telescope.nvim")
  local function _2_()
    local diaglist = require("diaglist")
    return diaglist.init()
  end
  _241({"onsails/diaglist.nvim", config = _2_, module = "diaglist"})
  return _241("nvim-lua/plenary.nvim")
end
do end (require("packer")).startup(_1_)
local config = require("nvim-treesitter.configs")
config.setup({ensure_installed = "maintained", highlight = {disable = {"commonlisp", "python"}, enable = true}, indent = {enable = false}, playground = {enable = true}})
vim.cmd(("colorscheme " .. "everforest"))
do
  local null_ls = require("null-ls")
  local diagnostics = null_ls.builtins.diagnostics
  null_ls.setup({sources = {diagnostics.flake8, diagnostics.gccdiag}})
end
do
  local options = {"exrc", "list", "expandtab", "termguicolors", "hidden"}
  for _, option in ipairs(options) do
    vim.opt[option] = true
  end
end
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader><leader>", "\30", {})
return vim.api.nvim_set_keymap("n", "<leader>dw", "<cmd> lua require('diaglist').open_alldiagnostics()<cr>", {})
