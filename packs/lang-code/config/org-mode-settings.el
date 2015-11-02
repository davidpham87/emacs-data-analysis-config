(defun disable-yas-tab-key ()
  "Disable the tab expension key in org-mode. Temporary hack"
  (define-key yas-minor-mode-map [(tab)] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<tab>") nil))

(add-hook 'org-mode-hook 'disable-yas-tab-key)
