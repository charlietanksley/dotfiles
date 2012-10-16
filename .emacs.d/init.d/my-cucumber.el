(progn
  ;; default language if .feature doesn't have "# language: fi"
  (setq feature-default-language "fi")
  ;; point to cucumber languages.yml or gherkin i18n.yml to use
  ;; exactly the same localization your cucumber uses
  (setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
  ;; and load feature-mode
  (require 'feature-mode)
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

(provide 'my-cucumber)
