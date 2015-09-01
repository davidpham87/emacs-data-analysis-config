;; Command for Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

(mapc (lambda (x) (add-hook 'LaTeX-mode-hook x))
      '('visual-line-mode 'flyspell-mode 'LaTeX-math-mode
                          'turn-on-reftex 'latex-extra-mode))

(setq reftex-plug-into-AUCTeX t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; For latex keybindings
(eval-after-load 'latex '(latex/setup-keybinds))
