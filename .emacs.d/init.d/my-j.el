(progn
  (autoload 'j-mode "j-mode.el"  "Major mode for J." t)
  (autoload 'j-shell "j-mode.el" "Run J from emacs." t)
  (setq auto-mode-alist
        (cons '("\\.ij[rstp]" . j-mode) auto-mode-alist))

  (setq j-path "~/j64-701/bin/"))

(provide 'my-j)
