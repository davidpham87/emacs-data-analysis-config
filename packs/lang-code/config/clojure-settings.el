;; Clojure auto-complete
(require 'company)
(require 'company-quickhelp)

(define-key cider-mode-map [C-tab] 'company-quickhelp-manual-begin)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'company-quickhelp-mode)

(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-quickhelp-mode)
