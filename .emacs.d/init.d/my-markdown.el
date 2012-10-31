(progn
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing markdown files" t)
  (setq auto-mode-alist
        (cons '("\\.md" . markdown-mode) auto-mode-alist))

  (defun my-markdown-custom ()
    "markdown-mode-hook"
        (setq markdown-command "multimarkdown"))
  (add-hook 'markdown-mode-hook 'my-markdown-custom))

(provide 'my-markdown)
