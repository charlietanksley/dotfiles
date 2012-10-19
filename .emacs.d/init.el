(add-to-list 'load-path "~/.emacs.d/init.d/")
(require 'my-paths)

; I'm only using el-get, but I think I need to specify where to find the stuff
; from elpa and marmalade

; ELPA
(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)


; This el-get install stuff is borrowed from
; https://github.com/dimitri/emacs-kicker/blob/master/init.el
;(require 'cl)       ; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

;; set local recipes
(setq el-get-sources
 '((:name smex                  ; like ido, but for M-x
    :after (progn
       (setq smex-save-file "~/.emacs.d/.smex-items")
       (global-set-key (kbd "M-x") 'smex)
       (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit                 ; git
    :after (progn
       (global-set-key (kbd "C-x g") 'magit-status)))

   (:name guru-mode             ; learn those keybindings
    :type elpa
    :after (progn
             (require 'guru-mode))

    (:name rsense
           :type elpa)


    ; why is this not installing?
    ; I think I installed this via packages.el (well, I tried to, whether it worked or not I don't know)
    ;; (:name znc                  ; znc + erc
    ;;        :type elpa)

    (:name perspective          ; workspaces
           :after (progn
                    (require 'perspective)
                    (persp-mode t))))))

;; now set our own packages
(setq my:el-get-packages
 '(el-get                       ; el-get is self-hosting
   auto-complete                ; complete as you type with overlays
;   auto-complete-ruby           ; auto-complete for ruby
   color-theme                  ; all the colors?!
   crontab-mode                 ; edit those crontabs
   find-file-in-project         ; scope find by projects
   idle-highlight-mode          ; show word under cursor everywhere
   ido-ubiquitous               ; ido everwhere
   inf-ruby                     ; ruby in your buffers
   keywiz                       ; keybinding drill
   paredit                      ; raw paren power
;   predictive                   ; auto-complete?
   rainbox-delimeters           ; rainbow parens!
   ri-emacs                     ; documentation in ruby
   ssh                          ; ssh from within emacs
   twilight-anti-bright-theme   ; colors
   zenburn-theme                ; moar!
))

(setq my:el-get-packages
      (append
       my:el-get-packages
       (mapcar 'el-get-source-name el-get-sources)))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

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
;; (setq undo-tree-mode-lighter "")
;; (require 'undo-tree)
;; (global-undo-tree-mode)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Subtler highlight
;; (set-face-background 'magit-item-highlight "#121212")
;; (set-face-foreground 'diff-context "#666666")
;; (set-face-foreground 'diff-added "#00cc33")
;; (set-face-foreground 'diff-removed "#ff0000")

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

; Windmove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))


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


; (load-theme 'solarized-dark t)
;; (after-load "color-theme"
;;             '(progn
;;                (load-theme 'zenburn)))
(mapc 'require '(my-paredit
                 my-ido
                 my-ruby
                 my-secrets
                 my-styles
                 my-irc
                 my-mu4e
                 my-org
                 my-rcirc))

;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; (require 'auto-complete-config)
;; (ac-config-default)
;  want to be sure to use the right keybindings
;(require 'guru-mode)
;
;(load "~/.emacs.d/init.d")
;
;(require 'my-ruby)
;
;; (load "~/.emacs.d/init.d/generic.el")
;; (load "~/.emacs.d/init.d/package-management.el")
;; (load "~/.emacs.d/init.d/secret.el")
;; 
;; ; plugins
;; (load "~/.emacs.d/init.d/org-mode.el")
;; (load "~/.emacs.d/init.d/ido.el")
;; (load "~/.emacs.d/init.d/paredit.el")
;; 
;; ; languages
;; (load "~/.emacs.d/init.d/scheme.el")
;; ; (load "~/.emacs.d/init.d/j.el")
;; ; (load "~/.emacs.d/init.d/clojure.el")
;; 
;; ; irc
;; (load "~/.emacs.d/init.d/rcirc.el")
;; experiments
;;(global-set-key (kbd "M-+") 'e2wm:start-management)
;
;
;
;; (require 'org-drill)
;
;; Try:
;; - ido-hacks
;(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(custom-safe-themes (quote ("159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "fca8ce385e5424064320d2790297f735ecfde494674193b061b9ac371526d059" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" default)))
; '(org-agenda-files nil)
; '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m))))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" default)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
