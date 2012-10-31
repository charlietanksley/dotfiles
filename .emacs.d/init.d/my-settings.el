(progn

  (setq smex-save-file "~/.emacs.d/.smex-items")

  ; No startup message
  (setq inhibit-startup-message t)
  ; Quiet that bell!
  (setq visible-bell 1)

  ; Whitespace
  (setq whitespace-style '(face trailing lines-tail tabs)
        whitespace-line-column 80)

  ; Use iswitchb
  (iswitchb-mode t)

  ; Advanced stuff Emacs disables by default
  (put 'narrow-to-region 'disabled nil)

  ; This is a tricky one.  I want for the right (and only the right) command key to function as a control key
  (setq mac-right-command-modifier 'control)
  (setq mac-allow-anti-aliasing t)

  ; Abbreviate 'yes or no' prompt to 'y or n'
  (fset 'yes-or-no-p 'y-or-n-p)

  ; Appearance stuff: no scroll bars or tool bars, make cursor blink
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode t)
  ; Show/highlight matching paren
  (show-paren-mode t)
  ; No clue what these two do
  (set-fringe-style -1)
  (tooltip-mode -1)
  (global-auto-revert-mode t)

  ; We don't need any extra backup files
  (setq make-backup-files nil)
  ; Don't save every file-visiting buffer
  (setq auto-save-default nil)

  (set-default 'indent-tabs-mode nil)
  (set-default 'indicate-empty-lines t)
  (set-default 'imenu-auto-rescan t)

  ;; Also auto refresh dired, but be quiet about it
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil)

  ;; Sentences do not need double spaces to end. Period.
  (set-default 'sentence-end-double-space nil)

  ;; Add parts of each file's directory to the buffer name if not unique
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward))

(provide 'my-settings)
