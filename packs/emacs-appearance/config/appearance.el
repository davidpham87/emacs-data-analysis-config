;; Set default font
(when (member "Source Code Pro" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
  (set-frame-font  "Source Code Pro-11" nil t))

(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 81))
(setq-default fill-column 79)           ; Automatic width formatting with M-q

;; (defun set-frame-width-interactive (arg)
;;   "Interactive version of frame width"
;;   (interacive "p")
;;   (set-frame-width (selected-frame) arg))

(menu-bar-mode 1) ; In order to see the menu-bar

;; Autocompletion ; Not sure the following is necessary with emacs-live
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)
;; (define-key ac-completing-map "\t" 'ac-complete)
;; (define-key ac-completing-map "\r" nil)
;; (define-key ac-completing-map [tab] 'ac-complete)
;; (define-key ac-completing-map [return] nil)

;; AutoComplete color
(set-face-attribute 'ac-candidate-face nil :background "#00222c"
                    :foreground "light gray")
(set-face-attribute 'ac-selection-face nil :background "SteelBlue4"
                    :foreground "white")
(set-face-attribute 'popup-tip-face nil :background "#003A4E"
                    :foreground "light gray")

;;; Set default Tab on 2
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
