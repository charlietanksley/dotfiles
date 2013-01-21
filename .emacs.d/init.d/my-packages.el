(progn
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

  (when (null package-archive-contents)
    (package-refresh-contents))

  (defvar my-packages '(ack-and-a-half
                        auto-complete
                        blank-mode
                        browse-kill-ring
                        circe
                        cl-lib
                        cljdoc ; eldoc clojure
                        clojure-mode
                        clojure-test-mode
                        color-theme
                        crontab-mode
                        ctags ; a ctags browser
                        elein
                        erlang
                        expand-region
                        find-file-in-project
                        geiser
                        git-blame ; git blame ;)
                        guru-mode
                        idle-highlight-mode
                        ido-ubiquitous
                        inf-ruby
                        j-mode
                        feature-mode
                        keywiz
                        magit
                        markdown-mode
                        midje-mode
                        multi-eshell
                        multiple-cursors
                        nrepl
                        pandoc-mode
                        paredit
                        perspective
                        pomodoro ; a pomodoro timer
                        projectile
                        quack
                        rainbow-delimiters
                        smex
                        solarized-theme
                        subatomic-theme
                        tabulated-list ; need for gist.el
                        twilight-theme
                        twittering-mode
                        undo-tree
                        window-number
                        w3
                        w3m
                        wrap-region
                        yaml-mode
                        yari ; ri interface
                        zen-and-art-theme
                        zenburn-theme
;                        znc
                        zossima))

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p)))

  ; gist.el related stuff
  ;(add-to-list 'load-path "~/.emacs.d/packages/logito")
  ;(add-to-list 'load-path "~/.emacs.d/packages/pcache")
  ;(add-to-list 'load-path "~/.emacs.d/packages/gh.el")
  (add-to-list 'load-path "~/.emacs.d/packages/ZNC.el")

                                        ; A few extra packages
  (add-to-list 'load-path "~/.emacs.d/packages/"))

(provide 'my-packages)
