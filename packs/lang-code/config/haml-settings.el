(add-hook 'haml-mode-hook
          (lambda ()
            (require 'emmet-mode)
            (setq emmet-indentation 2)
            (define-key emmet-mode-keymap (kbd "RET") 'newline)
            (define-key emmet-mode-keymap (kbd "C-j")
              'electric-newline-and-maybe-indent)
            (define-key emmet-mode-keymap (kbd "C-m") 'emmet-expand-line)))
(add-hook 'haml-mode-hook 'emmet-mode)
