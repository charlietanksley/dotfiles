(push "/usr/local/bin" exec-path)

(load "~/.emacs.d/init.d/generic.el")
(load "~/.emacs.d/init.d/package-management.el")
(load "~/.emacs.d/init.d/secret.el")

; plugins
(load "~/.emacs.d/init.d/org-mode.el")
(load "~/.emacs.d/init.d/ido.el")
(load "~/.emacs.d/init.d/paredit.el")

; languages
(load "~/.emacs.d/init.d/scheme.el")
; (load "~/.emacs.d/init.d/j.el")
; (load "~/.emacs.d/init.d/clojure.el")


; Try:
; - ido-hacks
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m
                                ;org-drill
                                )))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ; I stole this from Gary Bernhardt.  It doesn't work here yet, but it will!
;; ; GRB: open temporary buffers in a dedicated window split
;; (setq special-display-regexps
;;         '("^\\*Completions\\*$"
;;           "^\\*Help\\*$"
;;           "^\\*grep\\*$"
;;           "^\\*Apropos\\*$"
;;           "^\\*elisp macroexpansion\\*$"
;;           "^\\*local variables\\*$"
;;           "^\\*Compile-Log\\*$"
;;           "^\\*Quail Completions\\*$"
;;           "^\\*Occur\\*$"
;;           "^\\*frequencies\\*$"
;;           "^\\*compilation\\*$"
;;           "^\\*Locate\\*$"
;;           "^\\*Colors\\*$"
;;           "^\\*tumme-display-image\\*$"
;;           "^\\*SLIME Description\\*$"
;;           "^\\*.* output\\*$"           ; tex compilation buffer
;;           "^\\*TeX Help\\*$"
;;           "^\\*Shell Command Output\\*$"
;;           "^\\*Async Shell Command\\*$"
;;           "^\\*Backtrace\\*$"))
;; (setq grb-temporary-window (nth 2 (window-list)))
;; (defun grb-special-display (buffer &optional data)
;;   (let ((window grb-temporary-window))
;;     (with-selected-window window
;;       (switch-to-buffer buffer)
;;       window)))
;; (setq special-display-function #'grb-special-display)

