;;; ruby-static-analysis.el --- Run static analysis on your ruby files

;; Copyright (C) 2013 Charlie Tanksley

;; Author: Charlie Tanksley <charlie@tanksley.me>
;; URL:
;; Version: 0.1
;; Created: 6 September 2013
;; Keywords: ruby static-analysis

;; This file is NOT part of GNU Emacs.

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

(defvar ruby-static-analysis-commands
  '(("cane" . "cane -f")))

(defun rsa-file ())
(print ruby-static-analysis-commands)
(provide 'ruby-static-analysis)
