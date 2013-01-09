(progn
  (require 'circe)

  (setq circe-network-options
        `(("Freenode"
           :host ,znc-server
           :port ,znc-port
           :pass ,znc-password
           ))))

(provide 'my-circe)
