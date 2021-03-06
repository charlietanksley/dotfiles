;; For now, I'm just borrowing this code.  I'll update it later. :)


;; sarter-kit-ruby.el --- Saner defaults and goodies for Ruby
;;
;; Copyright (c) 2008-2012 Phil Hagelberg and contributors
;;
;; Author: Phil Hagelberg <technomancy@gmail.com>
;; URL: http://www.emacswiki.org/cgi-bin/wiki/StarterKit
;; Version: 2.0.3
;; Keywords: convenience
;; Package-Requires: ((inf-ruby "2.2.3"))
;; This file is not part of GNU Emacs.

;;; Commentary:

;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; This file contains tweaks specific to Ruby.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;;;###autoload
(progn
  (eval-after-load 'ruby-mode
    '(progn
       ;; work around possible elpa bug
       (ignore-errors (require 'ruby-compilation))
       (setq ruby-use-encoding-map nil)
       (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
       (autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)

       (add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings)
;       (add-hook 'ruby-mode-hook 'inf-ruby-keys)

       (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
       (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
       (setq ruby-deep-indent-paren nil)))

  ; (define-key 'help-command (kbd "S-r") 'ri)

  ;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

  ;; We never want to edit Rubinius bytecode or MacRuby binaries
  (add-to-list 'completion-ignored-extensions ".rbc")
  (add-to-list 'completion-ignored-extensions ".rbo")

;;; Rake

  (defun pcomplete/rake ()
    "Completion rules for the `ssh' command."
    (pcomplete-here (pcmpl-rake-tasks)))

  (defun pcmpl-rake-tasks ()
    "Return a list of all the rake tasks defined in the current
projects.  I know this is a hack to put all the logic in the
exec-to-string command, but it works and seems fast"
    (delq nil (mapcar '(lambda(line)
                         (if (string-match "rake \\([^ ]+\\)" line) (match-string 1 line)))
                      (split-string (shell-command-to-string "rake -T") "[\n]"))))

  (defun rake (task)
    (interactive (list (completing-read "Rake (default: default): "
                                        (pcmpl-rake-tasks))))
    (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))


  ;; Clear the compilation buffer between test runs.
  (eval-after-load 'ruby-compilation
    '(progn
       (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
         (let ((comp-buffer-name (format "*%s*" name)))
           (when (get-buffer comp-buffer-name)
             (with-current-buffer comp-buffer-name
               (delete-region (point-min) (point-max))))))
       (ad-activate 'ruby-do-run-w/compilation))))

  ;; Rinari (Minor Mode for Ruby On Rails)
  ;; (setq rinari-major-modes
  ;;       (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
  ;;             'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook)))


;; (setq project-root (locate-dominating-file (buffer-file-name) ".git"))

;; (defun rake-migrate ()
;;   (interactive)
;;   (start-process-shell-command
;;    "migrations"
;;    "migrations"
;;    (concat project-root "b/rake db:migrate && b/rake db:rollback && b/rake db:migrate"))
;;   (start-process-shell-command
;;    "migrations-test"
;;    "migrations-test"
;;    (concat project-root "RAILS_ENV=test b/rake db:migrate && b/rake db:rollback && b/rake db:migrate")))

;; (defun rake-deploy ()
;;   (interactive)
;;   (start-process-shell-command
;;    "rake-deploy"
;;    "rake deploy"
;;    (concat project-root "b/rake deploy:staging")))

;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (toggle-read-only)
;;   (ansi-color-apply-on-region (point-min) (point-max))
;;   (toggle-read-only))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(defun rake-rspec ()
  (interactive)
  (start-process-shell-command
   "rake-rspec"
   "rake rspec"
   (concat project-root "b/rspec spec")))

;; Handle erb templates
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-code-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'web-mode-hook  'web-mode-hook)

(provide 'my-ruby)
;;; my-ruby.el ends here
