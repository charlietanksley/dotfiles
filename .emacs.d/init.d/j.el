(autoload 'j-mode "j-mode.el"  "Major mode for J." t)
(autoload 'j-shell "j-mode.el" "Run J from emacs." t)
(setq auto-mode-alist
            (cons '("\\.ij[rstp]" . j-mode) auto-mode-alist))
(setq j-command "~/j701/bin/jconsole")
