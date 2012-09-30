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
           erc-nick '("charlietanksley")
           ;erc-autojoin-timing :ident
           erc-flood-protect nil
           ;erc-autojoin-channels-alist
           ;'(("freenode.net" "#emacs" "#clojure" "#leiningen"))
           erc-prompt-for-nickserv-password nil)

     (require 'erc-services)
     (require 'erc-spelling)
     (require 'erc-truncate)
     (require 'erc-hl-nicks)
     ; http://www.emacswiki.org/emacs-en/ErcZNC
     (require 'znc)
     (erc-services-mode 1)
     (add-to-list 'erc-modules 'hl-nicks 'spelling)
     (add-hook 'erc-connect-pre-hook (lambda (x) (erc-update-modules)))
     (add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
     (set-face-foreground 'erc-input-face "dim gray")
     (set-face-foreground 'erc-my-nick-face "blue")))

(setq pcomplete-cycle-completions nil)

;(ignore-errors
;  (load (expand-file-name "~/.chorts.el"))
;
;  (setq erc-nickserv-passwords
;        `((freenode (("technomancy" . ,freenode)
;                     ("TeXnomancy" . ,freenode))))))

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
