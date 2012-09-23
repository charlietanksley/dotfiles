(require 'rcirc)

; These two things come from
; http://superuser.com/questions/249563/using-rcirc-with-a-irc-bouncer-like-znc
; (setq rcirc-server-alist '(("znc-server" :nick "znc-username" :password "znc-username:znc-password" :full-name "full-name")))
; That is specified in the secret file :)

(defun rcirc-detach-buffer ()
    (interactive)
      (let ((buffer (current-buffer)))
            (when (and (rcirc-buffer-process)
                                  (eq (process-status (rcirc-buffer-process)) 'open))
                    (with-rcirc-server-buffer
                          (setq rcirc-buffer-alist
                                          (rassq-delete-all buffer rcirc-buffer-alist)))
                          (rcirc-update-short-buffer-names)
                                (if (rcirc-channel-p rcirc-target)
                                        (rcirc-send-string (rcirc-buffer-process)
                                                                            (concat "DETACH " rcirc-target))))
                (setq rcirc-target nil)
                    (kill-buffer buffer)))

(define-key rcirc-mode-map [(control c) (control d)] 'rcirc-detach-buffer)

;; Turn on spell checking.
(add-hook 'rcirc-mode-hook (lambda ()
			     (flyspell-mode 1)))

;; Keep input line at bottom.                                                                               
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (set (make-local-variable 'scroll-conservatively)
		 8192)))

;; Turn on logging everything to a special buffer, for debugging.
(setq rcirc-debug-flag t)

;; Adjust the colours of one of the faces.
(set-face-foreground 'rcirc-my-nick "red" nil)


;; Include date in time stamp.
(setq rcirc-time-format "%Y-%m-%d %H:%M ")
                                        ; ;; You can autoload, but at the end of this block we'll
; ;; connect to two networks anyway.
; 
; 
; ;; Don't print /away messages.
; ;; This does not require rcirc to be loaded already,
; ;; since rcirc doesn't define a 301 handler (yet).
; (defun rcirc-handler-301 (process cmd sender args)
;   "/away message handler.")
; 
; ;; Turn on spell checking.
; (add-hook 'rcirc-mode-hook (lambda ()
; 			     (flyspell-mode 1)))
; 
; ;; Keep input line at bottom.                                                                               
; (add-hook 'rcirc-mode-hook
; 	  (lambda ()
; 	    (set (make-local-variable 'scroll-conservatively)
; 		 8192)))
; 
; ;; Turn on logging everything to a special buffer, for debugging.
; (setq rcirc-debug-flag t)
; 
; ;; Adjust the colours of one of the faces.
; (set-face-foreground 'rcirc-my-nick "red" nil)
; 
; ;; Include date in time stamp.
; (setq rcirc-time-format "%Y-%m-%d %H:%M ")
; 
; ;; Change user info
; (setq rcirc-default-nick "charlietanksley")
; (setq rcirc-default-user-name "charlietanksley")
; (setq rcirc-default-full-name "Charlie Tanksley")
; 
; ;; Join these channels at startup.
; (setq rcirc-startup-channels-alist
;       '(("\\.freenode\\.net$" "#emacs" "#rcirc")))
; 
; ;; Connect to servers.
; (rcirc); freenode is the default
; ;(rcirc-connect "localhost") ; if you run bitlbee, this will connect to it
