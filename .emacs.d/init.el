;; emacs configuration
(push "/usr/local/bin" exec-path)

; We don't need any extra backup files
(setq make-backup-files nil)
; Don't save every file-visiting buffer
(setq auto-save-default nil)
; Use spaces, not tabs
(setq-default indent-tabs-mode nil)
; No startup message
(setq inhibit-startup-message t)
; Quiet that bell!
(setq visual-bell 1)

; show the line numbers
(global-linum-mode 1)
; if you don't want it to come on in some places, turn it on selectively 
; (add-hook 'sh-mode-hook
;           '(lambda ()
;             (linum-on)))

; Advanced stuff Emacs disables by default
(put 'narrow-to-region 'disabled nil)

; This is a tricky one.  I want for the right (and only the right) command key to function as a control key
(setq mac-right-command-modifier 'control)

; Abbreviate 'yes or no' prompt to 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
; Appearance stuff: no scroll bars or tool bars, make cursor blink
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
; Show/highlight matching paren
(show-paren-mode t)
; No clue what these two do
(set-fringe-style -1)
(tooltip-mode -1)

(set-frame-font "Inconsolata-18")
(load-theme 'tango-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SPECIFIC PACKAGE CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Management ;;
;;;;;;;;;;;;;;;;;;;;;;;;

; I'm using both elpa and el-get (and some roll your own!) for package
; management.  Why not?  What could go wrong?!

  ; ELPA
  (require 'package)
  ;; Add the original Emacs Lisp Package Archive
  (add-to-list 'package-archives
               '("elpa" . "http://tromey.com/elpa/"))
  ;; Add the user-contributed repository
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)


  ; EL-GET
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
  (require 'el-get)

  (el-get 'sync '(magit
                  auto-complete
                  gist
                  ; colors
                  color-theme
                  color-theme-solarized
                  color-theme-ir-black
                  ; CSS and SCSS
                  scss-mode
                  ; text editing
                  markdown-mode
                  ; Ruby
                  ri-emacs
                  ; ruby-mode ; I think this might already be installed?
                  ; Considering, for Ruby
                  rinari ; pretty comprehensive, I think. For Rails.
                  rspec-mode
                  ; Scheme, Clojure, and Lisp
                  rainbow-delimiters
                  paredit
                  ; slime ; this didn't work right.
                  ; Scheme
                  scheme-complete
                  quack
                  ; Clojure
                  clojure-mode
                  ; durendal?
                  midje-mode
                  swank-clojure))


;;;;;;;;;;;;;;
;; Org-mode ;;
;;;;;;;;;;;;;;
(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(require 'org-install)
(require 'org-habit)
;(require 'org-drill)


;;;;;;;;;
;; IDO ;;
;;;;;;;;;
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
;(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml"
;".el" ".ini" ".cfg" ".cnf"))
(setq ido-ignore-extensions t)
; M-x customize-variable RET completion-ignored-extensions. Go ahead
; and add all the useless object files, backup, autosave and other
; computing flotsam you don’t want Ido to show.

;;;;;;;;;;;;;
;; Paredit ;;
;;;;;;;;;;;;;
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode +1)))

(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;                                                            ;;
;; ; Chicken Scheme ;                                                            ;;
;; ;;;;;;;;;;;;;;;;;;                                                            ;;
;; (add-to-list 'load-path "~/.emacs.d/packages/swank-chicken/")                 ;;
;; (add-to-list 'load-path "/usr/local/lib/chicken/6/")                          ;;
;; ;(load 'swank-chicken)                                                        ;;
;; ;(slime-setup '(slime-fancy slime-banner))   ; If you don't use SLIME already ;;
;;                        ; Refer to the SLIME manual for setup instructions     ;;
;;                                                                               ;;
;; (autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken" t)       ;;
;;                                                                               ;;
;; ;; If your csi executable is in a non-standard location                       ;;
;; (setq slime-csi-path "/usr/local/bin/csi")                                    ;;
;;                                                                               ;;
;; (add-hook 'scheme-mode-hook                                                   ;;
;;           (lambda ()                                                          ;;
;;             (slime-mode t)))                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setenv "CHICKEN_DOC_REPOSITORY" "~/.chicken/chicken-doc/")
;; This elisp snippet will look up the word at point and display its
;; documentation (or matches) in your *scheme* window and display it in a
;; split window unless it is already visible.

(defun chicken-doc (&optional obtain-function)
  (interactive)
  (let ((func (funcall (or obtain-function 'current-word))))
    (when func
      (process-send-string (scheme-proc)
                           (format "(require-library chicken-doc) ,doc %S\n" func))
      (save-selected-window
        (select-window (display-buffer (get-buffer scheme-buffer) t))
        (goto-char (point-max))))))
  
(eval-after-load 'cmuscheme
 '(define-key scheme-mode-map "\C-cd" 'chicken-doc))

;; Additionally, because multiple matches may be listed, this snippet
;; will allow you to place your cursor at the beginning of the match
;; s-expression and get the actual documentation:
(eval-after-load 'cmuscheme
 '(define-key inferior-scheme-mode-map "\C-cd"
    (lambda () (interactive) (chicken-doc 'sexp-at-point))))

;; ;;; Always do syntax highlighting
;; (global-font-lock-mode 1)

;; ;;; Also highlight parens
;; (setq show-paren-delay 0
;;       show-paren-style 'parenthesis)
;; (show-paren-mode 1)

;; ;;; This is the binary name of my scheme implementation
;; (setq scheme-program-name "csi")


;;;;;;;;;;;;;
;; Clojure ;;
;;;;;;;;;;;;;

; To get swank-clojure working properly
(setenv "PATH" (shell-command-to-string "echo $PATH"))
; For ClojureScript
; From: https://github.com/brentonashworth/one/wiki/Emacs
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Allow input to be sent to somewhere other than inferior-lisp
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is a total hack: we're hardcoding the name of the shell buffer
(defun shell-send-input (input)
  "Send INPUT into the *shell* buffer and leave it visible."
  (save-selected-window
    (switch-to-buffer-other-window "*shell*")
    (goto-char (point-max))
    (insert input)
    (comint-send-input)))

(defun defun-at-point ()
  "Return the text of the defun at point."
  (apply #'buffer-substring-no-properties
         (region-for-defun-at-point)))

(defun region-for-defun-at-point ()
  "Return the start and end position of defun at point."
  (save-excursion
    (save-match-data
      (end-of-defun)
      (let ((end (point)))
        (beginning-of-defun)
        (list (point) end)))))

(defun expression-preceding-point ()
  "Return the expression preceding point as a string."
  (buffer-substring-no-properties
   (save-excursion (backward-sexp) (point))
   (point)))

(defun shell-eval-last-expression ()
  "Send the expression preceding point to the *shell* buffer."
  (interactive)
  (shell-send-input (expression-preceding-point)))

(defun shell-eval-defun ()
  "Send the current toplevel expression to the *shell* buffer."
  (interactive)
  (shell-send-input (defun-at-point)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c e") 'shell-eval-last-expression)
             (define-key clojure-mode-map (kbd "C-c x") 'shell-eval-defun)))

;;;; Running the above:
;; Run M-x shell to get a new *shell* buffer
;; In the *shell* buffer, change to the One directory by typing cd /path/to/one
;; Start a Clojure REPL by running script/repl
;; Start the dev server in the REPL by executing (use 'one.sample.dev-server) and then (run-server)
;; Open a new emacs window and switch to it: C-x 2 followed by C-x o
;; Change the default directory of the new window: M-x cd followed by /path/to/one
;; Start another Clojure REPL by typing C-u M-x inferior-lisp followed by script/repl
;; Start a ClojureScript REPL in the new Clojure REPL with the commands (use 'one.sample.dev-server) and (cljs-repl)
;; Connect a browser session to the ClojureScript REPL by opening a browser and visiting http://localhost:8080/.

;; You're now ready to run commands in either the Clojure REPL or the ClojureScript one. Use the following keys:

;; C-M-x: Send the top-level expression at point to the inferior-lisp buffer (in our example, this is the ClojureScript REPL).
;; C-c C-e: Send the expression that ends just before point to the inferior-lisp buffer (in our example, this is the ClojureScript REPL).
;; C-c x: Send the top-level expression at point to the shell buffer (in our example, this is the Clojure REPL).
;; C-c e: Send the expression that ends just before point to the shell buffer (in our example, this is the Clojure REPL).


; Try:
; - ido-hacks
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-drill))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ; I stole this from Gary Bernhardt.  It doesn't work here yet, but it will!
;; ; GRB: open temporary buffers in a dedicated window split
;; (setq special-display-regexps
;;         '("^\\*Completions\\*$"
;;           "^\\*Help\\*$"
;;           "^\\*grep\\*$"
;;           "^\\*Apropos\\*$"
;;           "^\\*elisp macroexpansion\\*$"
;;           "^\\*local variables\\*$"
;;           "^\\*Compile-Log\\*$"
;;           "^\\*Quail Completions\\*$"
;;           "^\\*Occur\\*$"
;;           "^\\*frequencies\\*$"
;;           "^\\*compilation\\*$"
;;           "^\\*Locate\\*$"
;;           "^\\*Colors\\*$"
;;           "^\\*tumme-display-image\\*$"
;;           "^\\*SLIME Description\\*$"
;;           "^\\*.* output\\*$"           ; tex compilation buffer
;;           "^\\*TeX Help\\*$"
;;           "^\\*Shell Command Output\\*$"
;;           "^\\*Async Shell Command\\*$"
;;           "^\\*Backtrace\\*$"))
;; (setq grb-temporary-window (nth 2 (window-list)))
;; (defun grb-special-display (buffer &optional data)
;;   (let ((window grb-temporary-window))
;;     (with-selected-window window
;;       (switch-to-buffer buffer)
;;       window)))
;; (setq special-display-function #'grb-special-display)

