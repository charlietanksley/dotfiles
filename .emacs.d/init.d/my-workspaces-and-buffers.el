(progn
  (require 'window-number)
  (window-number-meta-mode t)

  ;; (require 'perspective)
  ;; (persp-mode t)

  (require 'workgroups)
  (setq wg-switch-on-load nil)
  (workgroups-mode 1)
  (wg-load "~/.emacs.d/.workgroups")

  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings)))

(provide 'my-workspaces-and-buffers)
