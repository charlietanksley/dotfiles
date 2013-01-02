(progn

  (setq org-directory "~/Dropbox/org")
  ;; (setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
  ;; (setq org-mobile-directory "~/Dropbox/MobileOrg")
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  ;(setq org-src-fontify-natively t)

  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (define-key global-map "\C-cc" 'org-capture)
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/org/tasks.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))

  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)
  (require 'org)
  (require 'org-habit)

  ;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
  (setq org-replace-disputed-keys t)

  ;; Fontify org-mode code blocks
  (setq org-src-fontify-natively t)

  ;; I really thought these things should all be in there to begin
  ;; with, but they clearly aren't. :( So require them myself!
  (add-to-list 'load-path "~/.emacs.d/packages/org-contrib/lisp")
  (require 'org-drill))

(provide 'my-org)
