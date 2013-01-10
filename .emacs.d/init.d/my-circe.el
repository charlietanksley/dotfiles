(progn
  (require 'circe)

  (setq circe-network-options
        `(("Freenode"
           :host ,znc-server
           :port ,znc-port
           :pass ,znc-password
           :channels ("#emacs" "#emacs-circe" "#bnr" "#clojure" "#rubyspec" "#erlang"))
          ("Campfire"
           :host ,znc-server
           :port ,znc-port
           :pass ,znc-campfire-pass
           :channels ("#serious_business" "#playground" "#people_s_liberation_front_of_big_nerd_ranch" "#team_car_ram_rod" "#demandbase"))))

  ;; (setq lui-flyspell-p t
  ;;     lui-flyspell-alist '((".*" "american"))
  ;;     )

  (setq circe-reduce-lurker-spam t)
  (require 'lui-autopaste)
  (add-hook 'circe-channel-mode-hook 'enable-lui-autopaste)

  (setq circe-format-server-topic "*** Topic change by {origin}: {topic-diff}")

  (add-hook 'circe-chat-mode-hook 'my-circe-prompt)
  ; I should truncate this buffer name...
  (defun my-circe-prompt ()
    (lui-set-prompt
     (concat (propertize (concat (buffer-name) ">")
                         'face 'circe-prompt-face)
             " ")))

  (setq
   lui-time-stamp-position 'right-margin
   lui-time-stamp-format "%H:%M")

  (add-hook 'lui-mode-hook 'my-circe-set-margin)
  (defun my-circe-set-margin ()
    (setq right-margin-width 5)))

(defun c-irc ()
  "Connect to IRC"
  (interactive)
  (circe "Freenode")
  (circe "Campfire"))

(provide 'my-circe)
