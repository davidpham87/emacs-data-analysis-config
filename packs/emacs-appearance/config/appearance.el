;; Set default font
(defun set-source-code-pro-font (&rest frame)
  "Set Adobe Source Code Pro font if exists"
  (when (member "Source Code Pro" (font-family-list))
    (set-frame-font "Source Code Pro-11" nil t)))

(add-hook 'after-make-frame-functions 'set-source-code-pro-font t)

(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 81))
(setq-default fill-column 79)           ; Automatic width formatting with M-q

(menu-bar-mode 1) ; In order to see the menu-bar

;; AutoComplete color
(set-face-attribute 'ac-candidate-face nil :background "#00222c"
                    :foreground "light gray")
(set-face-attribute 'ac-selection-face nil :background "SteelBlue4"
                    :foreground "white")
(set-face-attribute 'popup-tip-face nil :background "#003A4E"
                    :foreground "light gray")

;;; Set default Tab on 2 (Erased in python mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

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
