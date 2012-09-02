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
                ;gist
                ; minimap
                ; colors
                ; color-theme
                ; color-theme-solarized
                ; color-theme-ir-black
                ; CSS and SCSS
                scss-mode
                ; text editing
                markdown-mode
                ; Ruby
                ri-emacs
                ; ruby-mode ; I think this might already be installed?
                ; Considering, for Ruby
                ; rinari ; pretty comprehensive, I think. For Rails.
                rspec-mode
                ; Scheme, Clojure, and Lisp
                rainbow-delimiters
                paredit
                sicp ; SICP
                ;geiser
                ; slime ; this didn't work right.
                ; Scheme
                scheme-complete
                quack))
                ; Clojure
                ; clojure-mode
                ; ; durendal?
                ; midje-mode
                ; swank-clojure))
