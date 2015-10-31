;; Aspell configuration
(if (eq system-type 'darwin)
    (if (file-executable-p "/usr/local/bin/aspell")
        (progn
          (setq ispell-program-name "/usr/local/bin/aspell"))
      ))

;; easy spell check
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
;; (global-set-key (kbd "C-M-<f8>") 'flyspell-buffer) ;; Potentially dangerous in Ubuntu
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)

(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )

(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
