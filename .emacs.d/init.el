(add-to-list 'load-path "~/.emacs.d/init.d/")
(require 'my-paths)
(require 'my-packages)

(require 'guru-mode)
(guru-mode t)

(setq smex-save-file "~/.emacs.d/.smex-items")
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
(autoload 'ack-and-a-half "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; region manipulation
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(require 'wrap-region)
(wrap-region-mode t)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

; back to me

(mapc 'require '(my-paredit
                 my-cucumber
                 my-ido
                 my-magit
                 my-markdown
                 my-ruby
                 my-secrets
                 my-settings
                 my-styles
                 my-irc
                 my-mu4e
                 my-org
                 my-programming
                 my-rcirc
                 my-ssh
                 my-workspaces-and-buffers
                 starter-kit-keybindings))

(setq custom-file "~/.emacs.d/init.d/emacs-custom.el")
(load custom-file 'noerror)
