(local instant (require "instant"))

(instant.attach
  {:on_data 
     #(match $1
       {:type "notification" :message str}
       (print str))})

(fn _G.join_session [host port]
  (instant.JoinSession host port)

  (fn current_buffer_server_handle []
    (local current_buffer (vim.api.nvim_buf_get_number 0))
    (let [server_buffers (collect [k v (pairs (instant.get_connected_buf_list))]
                           (values v k))]
      (. server_buffers current_buffer)))

  (fn _G.save_server_buffer [] (instant.send_data
          {:type "bufcommand"
           :command "write"
           :buffer_handle (current_buffer_server_handle)})))
