(progn
  (require 'projectile)
  (projectile-global-mode t)

  (defun my-linum-mode ()
    (linum-mode t))

  (defun my-idle-highlight-mode ()
    (require 'idle-highlight-mode)
    (idle-highlight-mode t))

  (defun my-rainbow-mode ()
    (rainbow-delimiters-mode t))

  (defun my-auto-wrap-comments ()
    (setq comment-auto-fill-only-comments t)
    (auto-fill-mode t))

  (defun my-blank-mode ()
    (autoload 'blank-mode-on "blank-mode"
      "Turn on blank visualisation" t))

  (add-hook 'prog-mode-hook 'my-auto-wrap-comments)
  (add-hook 'prog-mode-hook 'my-idle-highlight-mode)
  (add-hook 'prog-mode-hook 'whitespace-mode)
  (add-hook 'prog-mode-hook 'my-linum-mode)
  (add-hook 'prog-mode-hook 'my-rainbow-mode)
  ;(add-hook 'prog-mode-hook 'my-blank-mode)
  )

(provide 'my-programming)
