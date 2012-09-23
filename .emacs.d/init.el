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

; irc
(load "~/.emacs.d/init.d/rcirc.el")
; experiments
;(global-set-key (kbd "M-+") 'e2wm:start-management)

; Windmove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

; guru
(require 'guru-mode)

; (require 'org-drill)

; Try:
; - ido-hacks
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "fca8ce385e5424064320d2790297f735ecfde494674193b061b9ac371526d059" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" default)))
 '(org-agenda-files nil)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m))))
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

