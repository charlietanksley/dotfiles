(progn
; Subtler highlight
  (global-set-key (kbd "C-x g") 'magit-status)
    ; (set-face-background 'magit-item-highlight "#121212")
  ; (set-face-foreground 'diff-context "#666666")
  ; (set-face-foreground 'diff-added "#00cc33")
  ; (set-face-foreground 'diff-removed "#ff0000")
  (setq magit-remote-ref-format 'remote-slash-name)
  (add-hook 'magit-log-mode-hook 'turn-on-auto-fill))

(provide 'my-magit)
