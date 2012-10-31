;;; erc-inline.el --- Inline images for ERC

;; Copyright (C) 2011  Ian Eure

;; Author: Ian Eure <ian.eure@gmail.com>
;; Keywords: multimedia, comm

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is an untested work in progress.

;;; Code:

(eval-when-compile (require 'cl))
(require 'url)
(require 'erc-button)

(defconst erc-inline-image-extensions
  '("jpg" "gif"))

(defconst erc-inline-image-types
  '(("image/jpeg" . jpeg)))

(defconst erc-inline-image-regexp
  (concat (regexp-opt erc-inline-image-extensions) "\\b"))

(define-minor-mode erc-inline-image-mode
  "Toggle loading images inline in the chat.")

(defun erc-inline-image-headers-end ()
  (save-excursion
    (goto-char (point-min))
    (re-search-forward "
?\n
?\n")
    (point)))

(defun erc-inline-image-content-type ()
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t))
      (when (re-search-forward "^content-type: "
                               (erc-inline-image-headers-end) t)
        (cdr (assoc (buffer-substring
                     (match-end 0)
                     (or (search-forward ";" (line-end-position) t)
                         (line-end-position)))
                    erc-inline-image-types))))))

(defun erc-inline-image-content ()
  (buffer-substring (erc-inline-image-headers-end) (point-max)))

(defun erc-inline-image-load ()
  "Load image(s) the region inline."
  (lexical-let ((buffer buffer)
                (url nil)
                (url-start nil)
                (url-end nil))
    (save-excursion
      (goto-char (region-beginning))
      (while (re-search-forward erc-button-url-regexp (region-end) t)
        (setq url (thing-at-point 'url))
        (when (looking-at erc-inline-image-regexp)
          (url-retrieve (match-string 0)
            (lambda (&rest _)
              (let ((type (erc-inline-image-content-type)))
                (when type)
                (add-text-properties beg end
                  (list 'invisible nil
                        'display
                        (list 'image
                              :type type
                              :data (erc-inline-image-content)
                              :ascent 'center :background nil))
                  buffer)))))))))



(provide 'erc-inline)
;;; erc-inline.el ends here
