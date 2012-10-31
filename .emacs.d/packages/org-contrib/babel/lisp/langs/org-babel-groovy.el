;;; org-babel-groovy.el --- org-babel functions for groovy evaluation

;; Copyright (C) 2010 Nathan Neff

;; Author: Nathan Neff, Dan Davison
;; Keywords: literate programming, reproducible research
;; Homepage: http://orgmode.org
;; Version: 0.01

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
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

;;; Commentary:

;; Org-Babel support for evaluating groovy source code.

;;; Code:
(require 'org-babel)

(org-babel-add-interpreter "groovy")

(add-to-list 'org-babel-tangle-langs '("groovy" "groovy" "#!/usr/bin/env groovy -e"))

(defun org-babel-execute:groovy (body params)
  "Execute a block of groovy code with org-babel.  This function is
called by `org-babel-execute-src-block'."
  (message "executing groovy source code block")
  (let* ((processed-params (org-babel-process-params params))
         (session (first processed-params))
         (vars (second processed-params))
         (result-params (third processed-params))
         (result-type (fourth processed-params))
         (full-body (concat
		    (mapconcat ;; define any variables
		     (lambda (pair)
		       (format "$%s=%s;"
			       (car pair)
			       (org-babel-groovy-var-to-groovy (cdr pair))))
		     vars "\n") "\n" (org-babel-trim body) "\n")) ;; then the source block body
	(session (org-babel-groovy-initiate-session session)))
    (org-babel-groovy-evaluate session full-body result-type)))

(defun org-babel-prep-session:groovy (session params)
  "Prepare SESSION according to the header arguments specified in PARAMS."
  (error "Sessions are not supported for groovy."))

;; helper functions

(defun org-babel-groovy-var-to-groovy (var)
  "Convert an elisp var into a string of groovy source code
specifying a var of the same value."
  (if (listp var)
      (concat "[" (mapconcat #'org-babel-groovy-var-to-groovy var ", ") "]")
    (format "%S" var)))

(defvar org-babel-groovy-buffers '(:default . nil))

(defun org-babel-groovy-initiate-session (&optional session params)
  "Simply return nil, as sessions are not supported by groovy"
nil)

(defvar org-babel-groovy-wrapper-method
  "
sub main {
%s
}
@r = main;
open(o, \">%s\");
print o join(\"\\n\", @r), \"\\n\"")

(defvar org-babel-groovy-pp-wrapper-method
  nil)

(defun org-babel-groovy-evaluate (session body &optional result-type)
  "Evaluate Groovy code in BODY"
 ;; external process evaluation
 (let ((infile (make-temp-file "org_babel_groovy_input_")))
   (save-excursion
     (with-temp-buffer
       (with-temp-file infile (insert body))
       ;; (message "buffer=%s" (buffer-string)) ;; debugging
       (shell-command (format "groovy %s" infile) (current-buffer))
       (buffer-string)))))

(provide 'org-babel-groovy)
;;; org-babel-groovy.el ends here
