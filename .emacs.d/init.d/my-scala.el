(progn
  (add-to-list 'load-path "~/.emacs.d/packages/ensime/elisp/")
  ;; ensime version: 2.10.0-0.9.8.9
  (require 'ensime)
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(provide 'my-scala)
