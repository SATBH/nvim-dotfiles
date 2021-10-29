(local instant (require "instant"))
(local instant_server (require "instant.server"))

(fn _G.start_instant_session []
  (instant_server.StartServer)
  (instant.StartSession "127.0.0.1" "8080")
  (instant.attach
    {:on_data
     (fn manage_incoming_data [data]
       (match data
         {:type "bufcommand"
          :command command
          :buffer_handle  handle}
         (do
           (vim.api.nvim_buf_call handle #(vim.cmd command))
           (instant.send_data
             {:type "notification"
              :message (string.format "Executed %s on buffer %s successfully"
                                      (values command handle))}))))}))

