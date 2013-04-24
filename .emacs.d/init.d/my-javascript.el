(progn
  (setq js-indent-level 2)

  (require 'js-comint)
  (setq inferior-js-program-command "rhino"
;/usr/bin/java org.mozilla.javascript.tools.shell.Main
        )
  (add-hook 'js2-mode-hook '(lambda ()
                              (local-set-key "\C-x\C-e" 'js-send-last-sexp)
                              (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
                              (local-set-key "\C-cb" 'js-send-buffer)
                              (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
                              (local-set-key "\C-cl" 'js-load-file-and-go))))


(provide 'my-javascript)
