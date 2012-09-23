(require 'ido)
; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)
; (setq ido-use-filename-at-point 'guess)
; (setq ido-create-new-buffer 'always)
; ;(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml"
;".el" ".ini" ".cfg" ".cnf"))
;(setq ido-ignore-extensions t)
; M-x customize-variable RET completion-ignored-extensions. Go ahead
; and add all the useless object files, backup, autosave and other
; computing flotsam you don’t want Ido to show.
(setq ido-mode t)
(setq ido-ubiquitous t)
(setq ido-enable-prefix nil
  ido-enable-flex-matching t
  ido-auto-merge-work-directories-length nil
  ido-create-new-buffer 'always
  ido-use-filename-at-point 'guess
  ido-use-virtual-buffers t
  ido-handle-duplicate-virtual-buffers 2
  ido-max-prospects 10)

