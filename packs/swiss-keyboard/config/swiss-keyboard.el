(require 'iso-transl)                   ; Allow for dead keys
(require 'dash)                         ; Modern elisp

(global-set-key (kbd "C-'") 'other-frame)
(global-set-key (kbd "C-<tab>") 'other-window) ; one key change windows

;; This is to make mac friendly
;; (setq mac-function-modifier 'control
;;       mac-command-modifier 'meta
;;       mac-right-command-modifier 'control
;;       mac-right-option-modifier 'nil
;;       mac-option-modifier nil
;;       )

;; Mac settings to have the same feeling as pc keyboard
;; (global-set-key "æ" '"{")
;; (global-set-key "§" '"[")
;; (global-set-key "‘" '"]")
;; (global-set-key "¶" '"}")
;; (global-set-key (kbd "C-<") '"\\")
;; (global-set-key (kbd "C-à") '"{")
;; (global-set-key (kbd "C-$") '"}")
;; (global-set-key (kbd "C-è") '"[")
;; (global-set-key (kbd "C-!") '"\\\{")

(delete-selection-mode t) ; Delete selection when pressing [delete] key
(global-set-key (kbd "<M-dead-circumflex>") 'join-line)  ; In order to avoid to hit SPC everytime

;; Should be default but sometimes are overwritten
(global-set-key [M-a] 'backward-sentence)
(global-set-key [M-e] 'forward-sentence)
(global-set-key [M-d] 'kill-sentence)

;; Rebind altgr + key to the correct default behavior
;; To get the same alt as the american keyboard
(let* ((km '(("«" "M-y") ("»" "M-x") ("¢" "M-c") ("“" "M-v") ("”" "M-b")
             ("æ" "M-a") ("ß" "M-s") ("ð" "M-d") ("đ" "M-f") ("ŋ" "M-g")
             ("ł" "M-w") ("€" "M-e") ("¶" "M-r") ("ŧ" "M-t")))
       (kmc (mapcar (lambda(y) (--map (concat "C-" it) y)) km)) ; C- variant
       (key-mapper (lambda (it) (define-key key-translation-map
                                  (kbd (car it)) (kbd (car (cdr it)))))))
  (mapc key-mapper km)
  (mapc key-mapper kmc))

;; (global-set-key (kbd "«") 'yank-pop)
;; (global-set-key (kbd "»") 'smex)
;; (global-set-key (kbd "ł") 'kill-ring-save)
;; (global-set-key (kbd "ŧ") 'transpose-words)
;; (global-set-key (kbd "¢") 'capitalize-word)
;; (global-set-key (kbd "æ") 'backward-sentence)
;; (global-set-key (kbd "€") 'forward-sentence)
;; (global-set-key (kbd "ð") 'kill-sentence)
;; (global-set-key (kbd "¶") 'paredit-raise-sexp)
;; (global-set-key (kbd "đ") 'forward-word)
;; (global-set-key (kbd "”") 'backward-word)
;; (global-set-key (kbd "“") 'cua-scroll-down)

;; Emacs-live rewrite
(global-set-key (kbd "C-h") 'help-command)
(define-key org-mode-map (kbd "C-h") 'help-command)

(global-set-key (kbd "C-\\") 'toggle-input-method)
(define-key ido-file-completion-map (kbd "C-\\") 'toggle-input-method)
(define-key paredit-mode-map (kbd "C-\\") 'toggle-input-method)

;; Make C-é delete backward
(global-set-key (kbd "C-é") 'delete-backward-char)
(define-key paredit-mode-map (kbd "C-é") 'paredit-backward-delete)

;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
(global-set-key (kbd "M-é") 'backward-kill-word)
(define-key ido-file-completion-map (kbd "M-é") 'backward-kill-word)
(define-key paredit-mode-map (kbd "M-é") 'paredit-backward-kill-word)

;; C-z is undo-tree-undo as I never use suspendend frame
(global-set-key (kbd "C-z") 'undo-tree-undo)

;; Should write for console C-c C-y instead of C-c C-z
