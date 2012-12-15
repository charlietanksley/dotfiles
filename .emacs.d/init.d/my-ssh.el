(progn
  (defun my-ssh-mode ()
    (shell-dirtrack-mode t)
    (setq ssh-directory-tracking-mode 'ftp)
    (setq dirtrackp nil)
    (setq tramp-default-method "scpc"))

  (add-hook 'ssh-mode-hook 'my-ssh-mode)

  (require 'tramp)
  (add-to-list 'tramp-default-user-alist '(nil nil "ubuntu") t)
  (tramp-set-completion-function "ssh"
             '((tramp-parse-sconfig "/etc/ssh_config")
               (tramp-parse-sconfig "~/.ssh/config")
               (tramp-parse-shosts "~/.ssh/known_hosts")
               (tramp-parse-hosts "/etc/hosts"))))

(provide 'my-ssh)
