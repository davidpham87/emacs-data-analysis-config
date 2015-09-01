(eval-after-load "speedbar"
  (lambda ()
    (mapc 'speedbar-add-supported-extension '(".clj" ".cljs" ".r"))))

(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
