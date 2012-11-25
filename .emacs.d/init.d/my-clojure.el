(progn
  (add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

  (setq nrepl-popup-stacktraces nil)
  (add-hook 'nrepl-interaction-mode-hook
              'nrepl-turn-on-eldoc-mode)
  )

(provide 'my-clojure)
