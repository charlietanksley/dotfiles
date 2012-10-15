(require 'rcirc)

(progn
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

  ; not sure about this one...
;   (eval-after-load 'rcirc
;     '(defun-rcirc-command reconnect (arg)
;       "Reconnect the server process."
;       (interactive "i")
;       (unless process
;         (error "There's no process for this target"))
;       (let* ((server (car (process-contact process)))
;              (port (process-contact process :service))
;              (nick (rcirc-nick process))
;              channels query-buffers)
;         (dolist (buf (buffer-list))
;           (with-current-buffer buf
;             (when (eq process (rcirc-buffer-process))
;               (remove-hook 'change-major-mode-hook
;                            'rcirc-change-major-mode-hook)
;               (if (rcirc-channel-p rcirc-target)
;                   (setq channels (cons rcirc-target channels))
;                 (setq query-buffers (cons buf query-buffers))))))
;         (delete-process process)
;         (rcirc-connect server port nick
;                        rcirc-default-user-name
;                        rcirc-default-full-name
;                        channels)))))

)

(provide 'my-rcirc)
