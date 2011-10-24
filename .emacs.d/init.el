;; emacs configuration
(push "/usr/local/bin" exec-path)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq visual-bell 1)

(setq mac-right-command-modifier 'control)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
;(column-number-mode t)
(show-paren-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

(set-frame-font "Menlo-16")
(load-theme 'tango-dark)
; COLORSCHEME
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-solarized-dark)

; This seems clearly Ruby specific
(setq-default tab-width 2)


;; SPECIFIC PACKAGE CONFIGURATION

; IDO
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
;(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
(setq ido-ignore-extensions t)
; M-x customize-variable RET completion-ignored-extensions. Go ahead and add all the useless object files, backup, autosave and other computing flotsam you don’t want Ido to show.

(require 'package)

;(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/" package-archives))
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
            '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

; I've installed a few packages via package.el, a few by hand, and a few by el-get.  This could
; be a disaster.

;;;;;;;;;;;;;;;;;;
; Chicken Scheme ;
;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/packages/swank-chicken/")
(add-to-list 'load-path "/usr/local/lib/chicken/6/")
;(load 'swank-chicken)
;(slime-setup '(slime-fancy slime-banner))   ; If you don't use SLIME already
                       ; Refer to the SLIME manual for setup instructions

(autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken" t)

;; If your csi executable is in a non-standard location
(setq slime-csi-path "/usr/local/bin/csi")

(add-hook 'scheme-mode-hook
          (lambda ()
            (slime-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; My el-get stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

; My packages
;(setq el-get-sources
;      '((:name markdown
;         :type git
;         :url "git://jblevins.org/git/markdown-mode.git"
;         :load "markdown-mode.el")))

;(setq my-packages
;      (append
;       '(color-theme)
;       (mapcar 'el-get-source-name el-get-sources)))


(el-get 'sync '(magit
                markdown-mode
                rainbow-delimiters
                ri-emacs
                auto-complete
                scheme-complete
                color-theme
                color-theme-solarized))

; Try:
; - ido-hacks
