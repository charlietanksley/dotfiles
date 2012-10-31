(add-to-list 'load-path "~/.emacs.d/init.d/")
(require 'my-paths)
(require 'my-packages)

(require 'campfire)

; config that doesn't really belong here

(require 'projectile)
(projectile-global-mode t)

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

; Generic emacs configuration

; We don't need any extra backup files
(setq make-backup-files nil)
; Don't save every file-visiting buffer
(setq auto-save-default nil)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

; A few things from Emacs Rocks
;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

; back to me

;; (require 'perspective)

;; ;; Enable perspective mode
;; (persp-mode t)

;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(add-hook 'text-mode-hook 'turn-on-flyspell)
; No startup message
(setq inhibit-startup-message t)
; Quiet that bell!
(setq visible-bell 1)

; Whitespace
(setq whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80)

; Use iswitchb
(iswitchb-mode t)

; Experiments in applying modes just to programming modes...
(defun my-linum-mode ()
  (linum-mode t))
(defun my-idle-highlight-mode ()
  (require 'idle-highlight-mode)
  (idle-highlight-mode t))
(defun my-rainbow-mode ()
  (rainbow-delimiters-mode t))

(add-hook 'prog-mode-hook 'my-idle-highlight-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'my-linum-mode)
(add-hook 'prog-mode-hook 'my-rainbow-mode)

; Advanced stuff Emacs disables by default
(put 'narrow-to-region 'disabled nil)

; This is a tricky one.  I want for the right (and only the right) command key to function as a control key
(setq mac-right-command-modifier 'control)
(setq mac-allow-anti-aliasing t)

; Abbreviate 'yes or no' prompt to 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)

; (delete-selection-mode t)
; Appearance stuff: no scroll bars or tool bars, make cursor blink
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
; Show/highlight matching paren
(show-paren-mode t)
; No clue what these two do
(set-fringe-style -1)
(tooltip-mode -1)
(global-auto-revert-mode t)


(mapc 'require '(my-paredit
                 my-cucumber
                 my-ido
                 my-magit
                 my-markdown
                 my-ruby
                 my-secrets
                 my-styles
                 my-irc
                 my-mu4e
                 my-org
                 my-rcirc
                 my-ssh
                 my-workspaces-and-buffers
                 starter-kit-keybindings))

(setq custom-file "~/.emacs.d/init.d/emacs-custom.el")
(load custom-file 'noerror)
