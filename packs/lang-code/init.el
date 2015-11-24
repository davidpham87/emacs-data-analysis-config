;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(mapc 'live-load-config-file
      '("r-settings.el" "python-settings.el" "latex-settings.el"
        "lang-code-settings.el" "flyspell-settings.el"
        "markdown-settings.el" "chrome-settings.el"
        "org-mode-settings.el"))
