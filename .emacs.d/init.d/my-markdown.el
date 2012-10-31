(progn
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing markdown files" t)

  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.mkd" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))

  (defun my-markdown-custom ()
    "markdown-mode-hook"
        (setq markdown-command "multimarkdown"))
  (add-hook 'markdown-mode-hook 'my-markdown-custom))

(provide 'my-markdown)
