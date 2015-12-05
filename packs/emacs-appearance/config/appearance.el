;; Set default font
(when (member "Source Code Pro" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Source Code Pro-11")))

(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 81))
(setq-default fill-column 79)           ; Automatic width formatting with M-q

(menu-bar-mode 1) ; In order to see the menu-bar

;;; Set default Tab on 2 (Erased in python mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(setq dired-listing-switches "-alhX")

;;; Show parenthesis and color in the mode
(defun rainbow-enable-in-mode ()
  (interactive)
  (rainbow-mode)
  (rainbow-delimiters-mode))

(mapc (function (lambda (x) (add-hook x 'rainbow-enable-in-mode)))
      '(text-mode-hook LaTeX-mode-hook emacs-lisp-mode python-mode-hook
                       R-mode))

(defun set-frame-width-interactive (arg)
  "Interactively set frame width"
   (interactive "p")
   (set-frame-width (selected-frame) arg))
