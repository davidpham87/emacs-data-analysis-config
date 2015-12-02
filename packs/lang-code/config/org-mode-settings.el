;; (defun disable-yas-tab-key ()
;;   "Disable the tab expension key in org-mode. Temporary hack"
;;   (define-key yas-minor-mode-map [(tab)] nil)
;;   (define-key yas-minor-mode-map (kbd "TAB") nil)
;;   (define-key yas-minor-mode-map (kbd "<tab>") nil))

;; (add-hook 'org-mode-hook 'disable-yas-tab-key)
(setq org-src-fontify-natively t)

(defun org-html-generate-style-link ()
  "Generate a link for css"
  (interactive)
  (let ((p (concat "#+SETUPFILE: "
                   user-emacs-directory
                   "packs/lang-code/lib/org-html-themes"
                   "/setup/theme-readtheorg.setup"))
        (code-p (concat "#+HTML_HEAD: <style>"
                        " pre.src {background: #3F3F3F; color: #DCDCCC;}"
                        " </style>")))
    (insert (concat p "\n" code-p))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
