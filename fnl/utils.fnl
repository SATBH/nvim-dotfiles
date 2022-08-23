(fn last-selection-range []
  (values (. (vim.api.nvim_buf_get_mark 0 "<") 1)
          (. (vim.api.nvim_buf_get_mark 0 ">") 1)))

{: last-selection-range}
