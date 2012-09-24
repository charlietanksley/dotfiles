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
(package-initialize)


; This el-get install stuff is borrowed from
; https://github.com/dimitri/emacs-kicker/blob/master/init.el
(require 'cl)       ; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

;; set local recipes
(setq
 el-get-sources
 '((:name smex                  ; like ido, but for M-x
    :after (lambda ()
       (setq smex-save-file "~/.emacs.d/.smex-items")
       (global-set-key (kbd "M-x") 'smex)
       (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit                 ; git
    :after (lambda ()
       (global-set-key (kbd "C-x g") 'magit-status)))

   (:name perspective           ; workspaces
    :after (lambda ()
      (persp-mode)))))

;; now set our own packages
(setq
 my:el-get-packages
 '(el-get                       ; el-get is self-hosting
   auto-complete                ; complete as you type with overlays
   twilight-anti-bright-theme   ; colors
   zenburn-theme                ; moar!
   keywiz                       ; keybinding drill
   guru-mode                    ; learn those keybindings
   perspective                  ; workspaces
   ri-emacs                     ; documentation in ruby
   rainbow-delimiters           ; make parens managable
   paredit))                    ; raw paren power

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

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

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
; No startup message
(setq inhibit-startup-message t)
; Quiet that bell!
(setq visible-bell 1)

; Whitespace
(setq whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80)

; Advanced stuff Emacs disables by default
(put 'narrow-to-region 'disabled nil)

; This is a tricky one.  I want for the right (and only the right) command key to function as a control key
(setq mac-right-command-modifier 'control)

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

(set-frame-font "Inconsolata-16")
;(load-theme 'tango-dark)
; (load-theme 'twilight-anti-bright-theme)


(push "/usr/local/bin" exec-path)

; I want to be sure to use the right keybindings
(require 'guru-mode)

(load "~/.emacs.d/init.d")

(require 'my-ruby)

; (load "~/.emacs.d/init.d/generic.el")
; (load "~/.emacs.d/init.d/package-management.el")
; (load "~/.emacs.d/init.d/secret.el")
; 
; ; plugins
; (load "~/.emacs.d/init.d/org-mode.el")
; (load "~/.emacs.d/init.d/ido.el")
; (load "~/.emacs.d/init.d/paredit.el")
; 
; ; languages
; (load "~/.emacs.d/init.d/scheme.el")
; ; (load "~/.emacs.d/init.d/j.el")
; ; (load "~/.emacs.d/init.d/clojure.el")
; 
; ; irc
; (load "~/.emacs.d/init.d/rcirc.el")
; experiments
;(global-set-key (kbd "M-+") 'e2wm:start-management)

; Windmove
; (when (fboundp 'windmove-default-keybindings)
;       (windmove-default-keybindings))


; (require 'org-drill)

; Try:
; - ido-hacks
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "fca8ce385e5424064320d2790297f735ecfde494674193b061b9ac371526d059" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" default)))
 '(org-agenda-files nil)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
