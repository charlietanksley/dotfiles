(add-to-list 'load-path "~/.emacs.d/init.d/")
(require 'my-paths)
(require 'my-packages)

(add-to-list 'load-path "~/.emacs.d/packages/pivotal-tracker")
(add-to-list 'load-path "~/.emacs.d/packages/emacs-vroom")
(add-to-list 'load-path "~/.emacs.d/packages/the-stable.el")

(require 'the-stable)

;; We need this to make some other packages work right.
(require 'cl-lib)

(require 'guru-mode)
(turn-on-guru-mode)

(autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
(autoload 'ack-and-a-half "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(require 'wrap-region)
(wrap-region-global-mode t)
;; Don't screw up key bindings in magit-mode
(add-to-list 'wrap-region-except-modes 'magit-status-mode)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

(mapc 'require '(my-clojure
                 my-c
                 my-coffeescript
                 my-cucumber
                 my-erlang
                 my-haskell
                 my-hippie
                 my-ido
                 my-irc
                 my-javascript
                 my-keybindings
                 my-magit
                 my-markdown
                 my-mu4e
                 my-org
                 my-paredit
                 my-programming
                 my-rcirc
                 my-ruby
                 my-scheme
                 my-secrets
                 my-settings
                 my-ssh
                 my-styles
                 my-workspaces-and-buffers
                 starter-kit-keybindings))

(setq custom-file "~/.emacs.d/init.d/emacs-custom.el")
(load custom-file 'noerror)
