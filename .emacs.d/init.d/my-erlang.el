(progn
  (require 'erlang-start)
  (setq erlang-electric-commands '(erlang-electric-semicolon))
  (defun my-erlang-mode-hook ()
    (setq inferior-erlang-machine-options '("-sname" "emacs"))
    (define-key erlang-mode-map (kbd "RET") 'newline-and-indent))

  (add-hook 'erlang-mode-hook 'my-erlang-mode-hook))

(provide 'my-erlang)
