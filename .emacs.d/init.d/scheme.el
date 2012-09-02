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


; (load-file "~/.emacs.d/packages/elisp-geiser-chicken.el")
; (require 'geiser-chicken)
; (setq geiser-active-implementations '(chicken))

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
