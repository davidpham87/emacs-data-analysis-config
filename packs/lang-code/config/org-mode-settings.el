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
  (let ((p (concat "#+SETUPFILE: " (concat user-emacs-directory
                                             "packs/lang-code/lib/org-html-themes"
                                             "/setup/theme-readtheorg.setup"))))
    (print p)
    p))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
