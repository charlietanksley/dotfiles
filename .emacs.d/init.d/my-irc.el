; totally stolen from http://p.hagelb.org/my-irc.el
(eval-after-load 'erc
  '(progn
     (when (not (package-installed-p 'erc-hl-nicks))
       (package-install 'erc-hl-nicks))
     (setq erc-prompt ">"
           erc-server-reconnect-timeout 30
           erc-fill-column 75
           erc-max-buffer-size 100000
           erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
           erc-track-exclude-types (append '("324" "329" "332" "333"
                                             "353" "477" "MODE")
                                           erc-hide-list)
           erc-flood-protect nil
           erc-autojoin-channels-alist
           '(("freenode" "#emacs" "#rspec" "#atlrug" "#bnr" "#clojure" "#rubyspec" "#erlang")
             ("Unknown" "#serious_business" "#team_car_ram_rod" "#demandbase" "#people_s_liberation_front_of_big_nerd_ranch"))
           erc-prompt-for-nickserv-password nil)

     (require 'erc-services)
     (require 'erc-spelling)
     (require 'erc-truncate)
     (require 'erc-hl-nicks)
     ; http://www.emacswiki.org/emacs-en/ErcZNC
     (require 'znc)
     (require 'erc-inline)
     (require 'erc-nicklist)
     (erc-inline-image-mode 1)
     ;(erc-image-mode 1)
     (erc-services-mode 1)

     (add-to-list 'erc-noncommands-list 'erc-cmd-NAMES)
     (setq erc-keywords '("\\bcharlie_tanksley\\b"
                          "\\bct\\b"
                          "\\bct:\\b"
                          "\\bCT\\b"
                          "\\bCT:\\b"
                          "\\bCharlie T.\\b"
                          "\\bCharlie T.:\\b"))

     ;; (defvar terminal-notify (executable-find "terminal-notifier") "The path to terminal-notifier")

     ;; (defun terminal-notify (title message)
     ;;   "Shows a message through the notification system using
     ;;  `terminal-notifier` as the program."
     ;;   (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
     ;;     (let* ((process (start-process "terminal-notiy" nil
     ;;                                    terminal-notify
     ;;                                    (encfn title)
     ;;                                    "-title" "Emacs")))
     ;;       (process-send-string process (encfn message))
     ;;       (process-send-string process "\n")
     ;;       (process-send-eof process)))
     ;;   t)

     ;; (defun my-erc-notify-hook (match-type nick message)
     ;;   "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
     ;;   (unless (posix-string-match "^\\** *Users on #" message)
     ;;     (terminal-notify
     ;;      (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
     ;;      message
     ;;      )))

     ;; (add-hook 'erc-text-matched-hook 'my-erc-notify-hook)

     (add-to-list 'erc-modules 'hl-nicks 'spelling)
     (add-hook 'erc-connect-pre-hook (lambda (x) (erc-update-modules)))
     (add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
     (set-face-foreground 'erc-input-face "dim gray")
     (set-face-foreground 'erc-my-nick-face "blue")))

(setq pcomplete-cycle-completions nil)
(setq erc-reuse-buffers t)


(defun clean-message (s)
  (let* ((s (replace-regexp-in-string ">" "&gt;" s))
         (s (replace-regexp-in-string "<" "&lt;" s))
         (s (replace-regexp-in-string "&" "&amp;" s))
         (s (replace-regexp-in-string "\"" "&quot;" s))))
  (replace-regexp-in-string "'" "&apos;" s))

;(defun call-libnotify (matched-type nick msg)
;  (ignore-errors
;    (let* ((cmsg  (split-string (clean-message msg)))
;           (nick   (first (split-string nick "!")))
;           (msg    (mapconcat 'identity (rest cmsg) " ")))
;      (shell-command-to-string
;       (format "notify-send -i %s/%s '%s says:' '%s'"
;               "/home/phil/src/emacs"
;               "etc/images/icons/hicolor/scalable/apps/emacs.svg"
;               nick msg)))))

;(add-hook 'erc-text-matched-hook 'call-libnotify)

(defun window-register-bottom (r &optional x)
  (interactive "cJump to register: \nP")
  (jump-to-register r)
  (walk-windows (lambda (w) (end-of-buffer))))

(global-set-key (kbd "C-x w") 'window-register-bottom)

(autoload 'erc-tls "erc" "" t)
(autoload 'erc-ssl "erc" "" t)

(provide 'my-irc)
