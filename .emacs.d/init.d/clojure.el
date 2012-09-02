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
