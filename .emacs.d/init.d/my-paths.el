(progn

; From prelude
;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell.
;; If you're using homebrew or port, modifying the PATH is essential.
  (let (osx-paths)
    (dolist (path '("/usr/local/bin" "/opt/local/bin" "/opt/local/sbin" "$HOME/bin")
                (setenv "PATH" (concat osx-paths (getenv "PATH"))))
      (push path exec-path)
      (setq osx-paths (concat (concat path ":") osx-paths))))

                                        ; http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
  ;; Setting rbenv path
  (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
  (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path))))

(provide 'my-paths)
