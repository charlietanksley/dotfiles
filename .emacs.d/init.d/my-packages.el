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
                        browse-kill-ring
                        color-theme
                        crontab-mode
                        ctags ; a ctags browser
                        expand-region
                        find-file-in-project
                        gist ; gist
                        git-blame ; git blame ;)
                        guru-mode
                        idle-highlight-mode
                        ido-ubiquitous
                        inf-ruby
                        feature-mode
                        keywiz
                        magit
                        markdown-mode
                        paredit
                        perspective
                        pomodoro ; a pomodoro timer
                        projectile
                        rainbow-delimiters
                        rspec-mode
                        smex
                        ssh
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
                        znc))

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p)))

                                        ; A few extra packages
  (add-to-list 'load-path "~/.emacs.d/packages/"))

(provide 'my-packages)
