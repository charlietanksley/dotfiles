;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; region manipulation
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand)
(global-set-key (kbd "C-:") 'hippie-expand-lines)

(require 'idomenu)
(global-set-key (kbd "C-x C-i") 'idomenu)

(provide 'my-keybindings)
