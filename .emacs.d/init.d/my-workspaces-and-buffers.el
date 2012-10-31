(progn
  (require 'window-number)
  (window-number-meta-mode t)

  (require 'perspective)
  (persp-mode t)

  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings)))

(provide 'my-workspaces-and-buffers)
