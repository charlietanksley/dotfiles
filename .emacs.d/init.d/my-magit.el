(progn
; Subtler highlight
  (set-face-background 'magit-item-highlight "#121212")
  (set-face-foreground 'diff-context "#666666")
  (set-face-foreground 'diff-added "#00cc33")
  (set-face-foreground 'diff-removed "#ff0000")
  (setq magit-remote-ref-format 'remote-slash-name))

(provide 'my-magit)
